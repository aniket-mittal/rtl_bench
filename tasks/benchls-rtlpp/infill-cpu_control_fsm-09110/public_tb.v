// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 20;
  localparam OW = 29;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_09110 dut (
    .clk(clk),
    .reset(in_vec[19:19]),
    .IR(in_vec[18:3]),
    .N(in_vec[2:2]),
    .Z(in_vec[1:1]),
    .C(in_vec[0:0]),
    .W_Adr(out_vec[28:26]),
    .R_Adr(out_vec[25:23]),
    .S_Adr(out_vec[22:20]),
    .adr_sel(out_vec[19:19]),
    .s_sel(out_vec[18:18]),
    .pc_ld(out_vec[17:17]),
    .pc_inc(out_vec[16:16]),
    .pc_sel(out_vec[15:15]),
    .ir_ld(out_vec[14:14]),
    .mw_en(out_vec[13:13]),
    .rw_en(out_vec[12:12]),
    .alu_op(out_vec[11:8]),
    .status(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 20'hb8274;
    stim[1] = 20'h9148b;
    stim[2] = 20'h263ec;
    stim[3] = 20'hb8dfe;
    stim[4] = 20'h2d9db;
    stim[5] = 20'h12590;
    stim[6] = 20'h34b46;
    stim[7] = 20'h1f3ae;
    stim[8] = 20'h16185;
    stim[9] = 20'h4197b;
    stim[10] = 20'h11540;
    stim[11] = 20'h4cd1f;
    stim[12] = 20'h6f1a3;
    stim[13] = 20'h6103d;
    stim[14] = 20'h046ed;
    stim[15] = 20'h2b929;
    stim[16] = 20'h2a138;
    stim[17] = 20'h1850e;
    stim[18] = 20'h6b788;
    stim[19] = 20'h55279;
    stim[20] = 20'h51f6d;
    stim[21] = 20'h17fef;
    stim[22] = 20'h29bb7;
    stim[23] = 20'h5db76;
    stim[24] = 20'h246f3;
    stim[25] = 20'h49385;
    stim[26] = 20'h644f0;
    stim[27] = 20'h51503;
    stim[28] = 20'h4c02f;
    stim[29] = 20'h0dc18;
    stim[30] = 20'h0bafd;
    stim[31] = 20'h69b1d;
    stim[32] = 20'h48e57;
    stim[33] = 20'h65d81;
    stim[34] = 20'h4e1b4;
    stim[35] = 20'h41f61;
    stim[36] = 20'h30978;
    stim[37] = 20'h5e585;
    stim[38] = 20'h78a23;
    stim[39] = 20'h71544;
    stim[40] = 20'h5c887;
    stim[41] = 20'h5024b;
    stim[42] = 20'h25376;
    stim[43] = 20'h75fb2;
    stim[44] = 20'h204b0;
    stim[45] = 20'h07370;
    stim[46] = 20'h27892;
    stim[47] = 20'h13893;
    stim[48] = 20'h1fe31;
    stim[49] = 20'h6f488;
    stim[50] = 20'h025f0;
    stim[51] = 20'h42b1e;
    stim[52] = 20'h44566;
    stim[53] = 20'h4f814;
    stim[54] = 20'h3cbdc;
    stim[55] = 20'h51f9b;
    stim[56] = 20'h3449a;
    stim[57] = 20'h6b148;
    stim[58] = 20'h23ca7;
    stim[59] = 20'h65b7c;
    stim[60] = 20'he1e17;
    stim[61] = 20'h5d9b1;
    stim[62] = 20'h0a80f;
    stim[63] = 20'h2b7f6;
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
      expv[0] = 29'h000000ff;
      expv[1] = 29'h000000ff;
      expv[2] = 29'h000000ff;
      expv[3] = 29'h000000ff;
      expv[4] = 29'h000000ff;
      expv[5] = 29'h00014080;
      expv[6] = 29'h000000c0;
      expv[7] = 29'h000000f0;
      expv[8] = 29'h000000f0;
      expv[9] = 29'h000000f0;
      expv[10] = 29'h000000f0;
      expv[11] = 29'h000000f0;
      expv[12] = 29'h000000f0;
      expv[13] = 29'h000000f0;
      expv[14] = 29'h000000f0;
      expv[15] = 29'h000000f0;
      expv[16] = 29'h000000f0;
      expv[17] = 29'h000000f0;
      expv[18] = 29'h000000f0;
      expv[19] = 29'h000000f0;
      expv[20] = 29'h000000f0;
      expv[21] = 29'h000000f0;
      expv[22] = 29'h000000f0;
      expv[23] = 29'h000000f0;
      expv[24] = 29'h000000f0;
      expv[25] = 29'h000000f0;
      expv[26] = 29'h000000f0;
      expv[27] = 29'h000000f0;
      expv[28] = 29'h000000f0;
      expv[29] = 29'h000000f0;
      expv[30] = 29'h000000f0;
      expv[31] = 29'h000000f0;
      expv[32] = 29'h000000f0;
      expv[33] = 29'h000000f0;
      expv[34] = 29'h000000f0;
      expv[35] = 29'h000000f0;
      expv[36] = 29'h000000f0;
      expv[37] = 29'h000000f0;
      expv[38] = 29'h000000f0;
      expv[39] = 29'h000000f0;
      expv[40] = 29'h000000f0;
      expv[41] = 29'h000000f0;
      expv[42] = 29'h000000f0;
      expv[43] = 29'h000000f0;
      expv[44] = 29'h000000f0;
      expv[45] = 29'h000000f0;
      expv[46] = 29'h000000f0;
      expv[47] = 29'h000000f0;
      expv[48] = 29'h000000f0;
      expv[49] = 29'h000000f0;
      expv[50] = 29'h000000f0;
      expv[51] = 29'h000000f0;
      expv[52] = 29'h000000f0;
      expv[53] = 29'h000000f0;
      expv[54] = 29'h000000f0;
      expv[55] = 29'h000000f0;
      expv[56] = 29'h000000f0;
      expv[57] = 29'h000000f0;
      expv[58] = 29'h000000f0;
      expv[59] = 29'h000000f0;
      expv[60] = 29'h000000ff;
      expv[61] = 29'h000000ff;
      expv[62] = 29'h00014080;
      expv[63] = 29'h000000c0;
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
