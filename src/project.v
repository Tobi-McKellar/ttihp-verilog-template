/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

 `default_nettype none

 module tt_um_tobimckellar_top (
     input  wire [7:0] ui_in,    // Dedicated inputs
     output wire [7:0] uo_out,   // Dedicated outputs
     input  wire [7:0] uio_in,   // IOs: Input path
     output wire [7:0] uio_out,  // IOs: Output path
     output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
     input  wire       ena,      // always 1 when the design is powered, so you can ignore it
     input  wire       clk,      // clock
     input  wire       rst_n     // reset_n - low to reset
 );

   // Output signals
   reg [7:0] pwm_duty_cycle;
   reg [23:0] counter;    // 24-bit counter for 2-second period
   reg rising;            // For breathing mode to track rising/falling duty cycle

   // MSB of ui_in determines mode: 0 for manual, 1 for breathing
   wire mode = ui_in[7];

   // Breathing mode constants
   localparam BREATHING_MAX = 100;      // Max duty cycle (100%)
   localparam BREATHING_STEP = 1;       // Step size for breathing effect
   localparam BREATHING_PERIOD = 12000000; // 12 million clock cycles for a 2-second period (assuming 6MHz clock)

   // Assign outputs
   assign uo_out = 0;                 // Other outputs can be assigned to 0 if unused
   assign uio_oe = 8'b00000001;        // Enable only uio_out[0] for output
   assign uio_out[7:1] = 0;            // Unused outputs set to 0
   assign uio_out[0] = (counter < pwm_duty_cycle) ? 1'b1 : 1'b0;  // PWM logic

   always @(posedge clk or negedge rst_n) begin
     if (!rst_n) begin
       counter <= 0;
       pwm_duty_cycle <= 0;
       rising <= 1'b1;
     end else begin
       // Increment counter
       counter <= counter + 1;

       // Check mode
       if (mode == 1'b1) begin
         // Breathing mode: duty cycle rises and falls
         if (counter >= BREATHING_PERIOD) begin
           counter <= 0;
           if (rising) begin
             pwm_duty_cycle <= pwm_duty_cycle + BREATHING_STEP;
             if (pwm_duty_cycle >= BREATHING_MAX)
               rising <= 1'b0;
           end else begin
             pwm_duty_cycle <= pwm_duty_cycle - BREATHING_STEP;
             if (pwm_duty_cycle <= 0)
               rising <= 1'b1;
           end
         end
       end else begin
         // Manual mode: duty cycle is determined by uio_in[6:0]
         pwm_duty_cycle <= uio_in[6:0];
       end
     end
   end

   // List all unused inputs to prevent warnings
   wire _unused = &{ena, 1'b0};

 endmodule
