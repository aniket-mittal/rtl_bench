// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 40;
  localparam OW = 22;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_11167 dut (
    .clk(clk),
    .rst(in_vec[39:39]),
    .cmd_phy_addr(in_vec[38:34]),
    .cmd_reg_addr(in_vec[33:29]),
    .cmd_data(in_vec[28:13]),
    .cmd_opcode(in_vec[12:11]),
    .cmd_valid(in_vec[10:10]),
    .data_out_ready(in_vec[9:9]),
    .mdio_i(in_vec[8:8]),
    .prescale(in_vec[7:0]),
    .cmd_ready(out_vec[21:21]),
    .data_out(out_vec[20:5]),
    .data_out_valid(out_vec[4:4]),
    .mdc_o(out_vec[3:3]),
    .mdio_o(out_vec[2:2]),
    .mdio_t(out_vec[1:1]),
    .busy(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 40'hfce038f05e;
    stim[1] = 40'hd27c10072b;
    stim[2] = 40'h3d30835c01;
    stim[3] = 40'h07195b662a;
    stim[4] = 40'h0125e60f04;
    stim[5] = 40'h029c2556e6;
    stim[6] = 40'h624e902f6b;
    stim[7] = 40'h05fd794e6b;
    stim[8] = 40'h4adabd0b02;
    stim[9] = 40'h4601639361;
    stim[10] = 40'h5697f4341b;
    stim[11] = 40'h5412b7f928;
    stim[12] = 40'h2c6652a48a;
    stim[13] = 40'h0d9179e0dd;
    stim[14] = 40'h7d8f8d8466;
    stim[15] = 40'h4248a4ef93;
    stim[16] = 40'h4d48660463;
    stim[17] = 40'h22159441b7;
    stim[18] = 40'h22c2b9de8f;
    stim[19] = 40'h4b91ca0a8e;
    stim[20] = 40'h3202b6f7f9;
    stim[21] = 40'h73a38aab1f;
    stim[22] = 40'h34ce1635b4;
    stim[23] = 40'h35c2b9b3d0;
    stim[24] = 40'h71502db0af;
    stim[25] = 40'h1227a14f43;
    stim[26] = 40'h54604446fa;
    stim[27] = 40'h70ae71795c;
    stim[28] = 40'h43b1c56c4a;
    stim[29] = 40'h20cbc8e6c5;
    stim[30] = 40'h032c32f985;
    stim[31] = 40'h71c2acd1b8;
    stim[32] = 40'h64dc78006e;
    stim[33] = 40'h1234a4e938;
    stim[34] = 40'h2f0e9f822b;
    stim[35] = 40'hbe361cab19;
    stim[36] = 40'h077a0c0cf0;
    stim[37] = 40'h3ab53cd56f;
    stim[38] = 40'h1051308f3d;
    stim[39] = 40'h757b3d7a71;
    stim[40] = 40'h552c5779d3;
    stim[41] = 40'h09f540902a;
    stim[42] = 40'h627684a426;
    stim[43] = 40'h010cace50b;
    stim[44] = 40'h4aa2bccc3a;
    stim[45] = 40'h1ebee82414;
    stim[46] = 40'h551ee1b932;
    stim[47] = 40'h220ed1985d;
    stim[48] = 40'h19f9bf5a3e;
    stim[49] = 40'hf96805b469;
    stim[50] = 40'h43f9995411;
    stim[51] = 40'h6f4723899a;
    stim[52] = 40'h2289a3bbc8;
    stim[53] = 40'h0fbe77b558;
    stim[54] = 40'h6b54f83d65;
    stim[55] = 40'h01299f2fe5;
    stim[56] = 40'h37cf887d3f;
    stim[57] = 40'h59ba378007;
    stim[58] = 40'h01736abcaf;
    stim[59] = 40'h3b0223fbf0;
    stim[60] = 40'h10092fad6b;
    stim[61] = 40'h25fcec24f0;
    stim[62] = 40'h753f8523ac;
    stim[63] = 40'h04a2443221;
    for (c = 0; c < N; c = c + 1) begin
      #1 in_vec = stim[c];
      #3 sample;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 22'h000002;
      expv[1] = 22'h000002;
      expv[2] = 22'h000002;
      expv[3] = 22'h200002;
      expv[4] = 22'h000005;
      expv[5] = 22'h000005;
      expv[6] = 22'h000005;
      expv[7] = 22'h000005;
      expv[8] = 22'h000005;
      expv[9] = 22'h000005;
      expv[10] = 22'h000005;
      expv[11] = 22'h000005;
      expv[12] = 22'h000005;
      expv[13] = 22'h000005;
      expv[14] = 22'h000005;
      expv[15] = 22'h000005;
      expv[16] = 22'h000005;
      expv[17] = 22'h000005;
      expv[18] = 22'h000005;
      expv[19] = 22'h000005;
      expv[20] = 22'h000005;
      expv[21] = 22'h000005;
      expv[22] = 22'h000005;
      expv[23] = 22'h000005;
      expv[24] = 22'h000005;
      expv[25] = 22'h000005;
      expv[26] = 22'h000005;
      expv[27] = 22'h000005;
      expv[28] = 22'h000005;
      expv[29] = 22'h000005;
      expv[30] = 22'h000005;
      expv[31] = 22'h000005;
      expv[32] = 22'h000005;
      expv[33] = 22'h000005;
      expv[34] = 22'h000005;
      expv[35] = 22'h000005;
      expv[36] = 22'h000002;
      expv[37] = 22'h200002;
      expv[38] = 22'h000005;
      expv[39] = 22'h000005;
      expv[40] = 22'h000005;
      expv[41] = 22'h000005;
      expv[42] = 22'h000005;
      expv[43] = 22'h000005;
      expv[44] = 22'h000005;
      expv[45] = 22'h000005;
      expv[46] = 22'h000005;
      expv[47] = 22'h000005;
      expv[48] = 22'h000005;
      expv[49] = 22'h000005;
      expv[50] = 22'h000002;
      expv[51] = 22'h200002;
      expv[52] = 22'h200002;
      expv[53] = 22'h200002;
      expv[54] = 22'h000005;
      expv[55] = 22'h000005;
      expv[56] = 22'h000005;
      expv[57] = 22'h000005;
      expv[58] = 22'h000005;
      expv[59] = 22'h000005;
      expv[60] = 22'h000005;
      expv[61] = 22'h000005;
      expv[62] = 22'h000005;
      expv[63] = 22'h000005;
      mismatches = 0;
      shown = 0;
      for (c = 0; c < N; c = c + 1) begin
        bad = 0;
        for (b = 0; b < OW; b = b + 1)
          if (expv[c][b] !== 1'bx && act[c][b] !== expv[c][b]) bad = 1;
        if (bad) begin
          mismatches = mismatches + 1;
          if (shown < 10) begin
            $display("MISMATCH cycle %0d: inputs=%h expected=%h got=%h", c, stim[c], expv[c], act[c]);
            shown = shown + 1;
          end
        end
      end
      if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
      else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    end
    $finish;
  end
endmodule
