module tt_um_tobimckellar_top (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path -- connect to ground
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);
  wire [5:0] ref;
  wire pwm_out;
  wire [31:0] counter;
  wire enable_pwm;
  wire breathe_state;
  reg [5:0] sin_value;
  reg [6:0] index;
  wire n4_o;
  wire n5_o;
  wire [5:0] n6_o;
  localparam [7:0] n8_o = 8'b00000000;
  wire n11_o;
  wire n13_o;
  wire [31:0] n15_o;
  wire [31:0] n17_o;
  wire [31:0] n19_o;
  wire n24_o;
  wire n25_o;
  wire [30:0] n26_o;
  wire [31:0] n27_o;
  wire n28_o;
  wire n30_o;
  wire n32_o;
  wire [31:0] n33_o;
  wire n34_o;
  wire n36_o;
  wire n38_o;
  wire n39_o;
  wire n41_o;
  reg [31:0] sin_ref_clock_div;
  reg [31:0] sin_ref_clock_ticks;
  wire n48_o;
  wire n49_o;
  wire [31:0] n51_o;
  wire [31:0] n53_o;
  wire n55_o;
  wire [31:0] n56_o;
  wire n58_o;
  wire [31:0] n59_o;
  wire [31:0] n61_o;
  wire [6:0] n62_o;
  wire [6:0] n64_o;
  wire [6:0] n65_o;
  wire [6:0] n67_o;
  wire [5:0] n71_o;
  wire [6:0] n73_o;
  wire [31:0] n74_o;
  reg [31:0] n79_q;
  reg n80_q;
  reg [31:0] n81_q;
  reg [5:0] n82_q;
  reg [6:0] n83_q;
  wire [7:0] n84_o;
  wire [5:0] n86_data; // mem_rd
  assign uo_out = n84_o;
  assign uio_oe = n8_o;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:36:12  */
  assign ref = n6_o; // (signal)
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:37:12  */
  assign pwm_out = n80_q; // (signal)
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:38:12  */
  assign counter = n81_q; // (signal)
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:39:12  */
  assign enable_pwm = n4_o; // (signal)
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:40:12  */
  assign breathe_state = n5_o; // (signal)
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:68:13  */
  always @*
    sin_value = n82_q; // (isignal)
  initial
    sin_value = 6'b000000;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:69:13  */
  always @*
    index = n83_q; // (isignal)
  initial
    index = 7'b0000000;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:73:24  */
  assign n4_o = ui_in[7];
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:74:27  */
  assign n5_o = ui_in[6];
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:75:17  */
  assign n6_o = ui_in[5:0];
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:84:23  */
  assign n11_o = ~rst_n;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:87:28  */
  assign n13_o = counter == 32'b00000000000000000000000000111111;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:90:40  */
  assign n15_o = counter + 32'b00000000000000000000000000000001;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:87:17  */
  assign n17_o = n13_o ? 32'b00000000000000000000000000000000 : n15_o;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:84:13  */
  assign n19_o = n11_o ? 32'b00000000000000000000000000000000 : n17_o;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:100:23  */
  assign n24_o = ~rst_n;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:103:34  */
  assign n25_o = ~breathe_state;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:104:25  */
  assign n26_o = {25'b0, ref};  //  uext
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:104:51  */
  assign n27_o = {1'b0, n26_o};  //  uext
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:104:51  */
  assign n28_o = $signed(n27_o) > $signed(counter);
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:105:40  */
  assign n30_o = 1'b1 & enable_pwm;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:104:21  */
  assign n32_o = n28_o ? n30_o : 1'b0;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:110:35  */
  assign n33_o = {26'b0, sin_value};  //  uext
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:110:35  */
  assign n34_o = $signed(n33_o) > $signed(counter);
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:111:40  */
  assign n36_o = 1'b1 & enable_pwm;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:110:21  */
  assign n38_o = n34_o ? n36_o : 1'b0;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:103:17  */
  assign n39_o = n25_o ? n32_o : n38_o;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:100:13  */
  assign n41_o = n24_o ? 1'b0 : n39_o;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:122:18  */
  always @*
    sin_ref_clock_div = 32'b00000000000000000000000000110010; // (isignal)
  initial
    sin_ref_clock_div = 32'b00000000000000000000000000110010;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:123:18  */
  always @*
    sin_ref_clock_ticks = n79_q; // (isignal)
  initial
    sin_ref_clock_ticks = 32'b00000000000000000000000000000000;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:126:22  */
  assign n48_o = ~rst_n;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:129:32  */
  assign n49_o = sin_ref_clock_ticks == sin_ref_clock_div;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:132:48  */
  assign n51_o = sin_ref_clock_ticks + 32'b00000000000000000000000000000001;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:129:17  */
  assign n53_o = n49_o ? 32'b00000000000000000000000000000000 : n51_o;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:134:32  */
  assign n55_o = n53_o == 32'b00000000000000000000000000000000;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:135:30  */
  assign n56_o = {25'b0, index};  //  uext
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:135:30  */
  assign n58_o = n56_o == 32'b00000000000000000000000001100011;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:138:40  */
  assign n59_o = {25'b0, index};  //  uext
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:138:40  */
  assign n61_o = n59_o + 32'b00000000000000000000000000000001;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:138:34  */
  assign n62_o = n61_o[6:0];  // trunc
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:135:21  */
  assign n64_o = n58_o ? 7'b0000000 : n62_o;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:134:17  */
  assign n65_o = n55_o ? n64_o : index;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:141:34  */
  assign n67_o = 7'b1100011 - index;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:126:13  */
  assign n71_o = n48_o ? sin_value : n86_data;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:126:13  */
  assign n73_o = n48_o ? 7'b0000000 : n65_o;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:126:13  */
  assign n74_o = n48_o ? sin_ref_clock_ticks : n53_o;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:125:9  */
  always @(posedge clk)
    n79_q <= n74_o;
  initial
    n79_q = 32'b00000000000000000000000000000000;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:99:9  */
  always @(posedge clk)
    n80_q <= n41_o;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:83:9  */
  always @(posedge clk)
    n81_q <= n19_o;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:125:9  */
  always @(posedge clk)
    n82_q <= n71_o;
  initial
    n82_q = 6'b000000;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:125:9  */
  always @(posedge clk)
    n83_q <= n73_o;
  initial
    n83_q = 7'b0000000;
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:125:9  */
  assign n84_o = {pwm_out, 7'b0000000};
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:14:9  */
  reg [5:0] n85[99:0] ; // memory
  initial begin
    n85[99] = 6'b000000;
    n85[98] = 6'b000000;
    n85[97] = 6'b000000;
    n85[96] = 6'b000001;
    n85[95] = 6'b000001;
    n85[94] = 6'b000010;
    n85[93] = 6'b000010;
    n85[92] = 6'b000011;
    n85[91] = 6'b000100;
    n85[90] = 6'b000101;
    n85[89] = 6'b000110;
    n85[88] = 6'b000111;
    n85[87] = 6'b001001;
    n85[86] = 6'b001010;
    n85[85] = 6'b001011;
    n85[84] = 6'b001101;
    n85[83] = 6'b001111;
    n85[82] = 6'b010000;
    n85[81] = 6'b010010;
    n85[80] = 6'b010100;
    n85[79] = 6'b010110;
    n85[78] = 6'b011000;
    n85[77] = 6'b011010;
    n85[76] = 6'b011100;
    n85[75] = 6'b011110;
    n85[74] = 6'b100000;
    n85[73] = 6'b100001;
    n85[72] = 6'b100011;
    n85[71] = 6'b100101;
    n85[70] = 6'b100111;
    n85[69] = 6'b101001;
    n85[68] = 6'b101011;
    n85[67] = 6'b101101;
    n85[66] = 6'b101111;
    n85[65] = 6'b110000;
    n85[64] = 6'b110010;
    n85[63] = 6'b110100;
    n85[62] = 6'b110101;
    n85[61] = 6'b110110;
    n85[60] = 6'b111000;
    n85[59] = 6'b111001;
    n85[58] = 6'b111010;
    n85[57] = 6'b111011;
    n85[56] = 6'b111100;
    n85[55] = 6'b111101;
    n85[54] = 6'b111101;
    n85[53] = 6'b111110;
    n85[52] = 6'b111110;
    n85[51] = 6'b111111;
    n85[50] = 6'b111111;
    n85[49] = 6'b111111;
    n85[48] = 6'b111111;
    n85[47] = 6'b111111;
    n85[46] = 6'b111110;
    n85[45] = 6'b111110;
    n85[44] = 6'b111101;
    n85[43] = 6'b111101;
    n85[42] = 6'b111100;
    n85[41] = 6'b111011;
    n85[40] = 6'b111010;
    n85[39] = 6'b111001;
    n85[38] = 6'b111000;
    n85[37] = 6'b110110;
    n85[36] = 6'b110101;
    n85[35] = 6'b110100;
    n85[34] = 6'b110010;
    n85[33] = 6'b110000;
    n85[32] = 6'b101111;
    n85[31] = 6'b101101;
    n85[30] = 6'b101011;
    n85[29] = 6'b101001;
    n85[28] = 6'b100111;
    n85[27] = 6'b100101;
    n85[26] = 6'b100011;
    n85[25] = 6'b100001;
    n85[24] = 6'b100000;
    n85[23] = 6'b011110;
    n85[22] = 6'b011100;
    n85[21] = 6'b011010;
    n85[20] = 6'b011000;
    n85[19] = 6'b010110;
    n85[18] = 6'b010100;
    n85[17] = 6'b010010;
    n85[16] = 6'b010000;
    n85[15] = 6'b001111;
    n85[14] = 6'b001101;
    n85[13] = 6'b001011;
    n85[12] = 6'b001010;
    n85[11] = 6'b001001;
    n85[10] = 6'b000111;
    n85[9] = 6'b000110;
    n85[8] = 6'b000101;
    n85[7] = 6'b000100;
    n85[6] = 6'b000011;
    n85[5] = 6'b000010;
    n85[4] = 6'b000010;
    n85[3] = 6'b000001;
    n85[2] = 6'b000001;
    n85[1] = 6'b000000;
    n85[0] = 6'b000000;
    end
  assign n86_data = n85[n67_o];
  /* vhdlsrc/tt_um_tobimckellar_top.vhd:141:34  */
endmodule

