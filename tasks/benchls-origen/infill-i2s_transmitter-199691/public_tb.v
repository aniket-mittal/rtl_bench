// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 37;
  localparam OW = 2;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_199691 dut (
    .S_AXIS_ACLK(clk),
    .S_AXIS_ARESETN(in_vec[36:36]),
    .S_AXIS_TVALID(in_vec[35:35]),
    .S_AXIS_TDATA(in_vec[34:3]),
    .S_AXIS_TLAST(in_vec[2:2]),
    .sck(in_vec[1:1]),
    .ws(in_vec[0:0]),
    .S_AXIS_TREADY(out_vec[1:1]),
    .sd(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 37'h036c546018;
    stim[1] = 37'h0973f3838a;
    stim[2] = 37'h18e23e3c7c;
    stim[3] = 37'h1a1bc84901;
    stim[4] = 37'h1b871a1ea4;
    stim[5] = 37'h12a56fb6c8;
    stim[6] = 37'h17fa39b220;
    stim[7] = 37'h10e67ac806;
    stim[8] = 37'h11a7ebc7c7;
    stim[9] = 37'h1c081aabd8;
    stim[10] = 37'h10fea4931c;
    stim[11] = 37'h1a11fd5325;
    stim[12] = 37'h17752d4d40;
    stim[13] = 37'h1ea1efcf9d;
    stim[14] = 37'h161be08021;
    stim[15] = 37'h136be0eda8;
    stim[16] = 37'h164f14de75;
    stim[17] = 37'h1e340014eb;
    stim[18] = 37'h1b171a7622;
    stim[19] = 37'h15db8f0310;
    stim[20] = 37'h1178d0abfe;
    stim[21] = 37'h161df48c6c;
    stim[22] = 37'h17c18a8d73;
    stim[23] = 37'h137fe90d57;
    stim[24] = 37'h14fff2a4fb;
    stim[25] = 37'h10a4910b31;
    stim[26] = 37'h1383a09b84;
    stim[27] = 37'h0a21c14e40;
    stim[28] = 37'h11f8f479a4;
    stim[29] = 37'h13fe18bea6;
    stim[30] = 37'h12e232d75b;
    stim[31] = 37'h121c32eaeb;
    stim[32] = 37'h14609a5cbe;
    stim[33] = 37'h19a35dc0c7;
    stim[34] = 37'h146c06348e;
    stim[35] = 37'h1d8a963c05;
    stim[36] = 37'h1299276474;
    stim[37] = 37'h13ebf2c8ca;
    stim[38] = 37'h1631320937;
    stim[39] = 37'h1c4a9bb525;
    stim[40] = 37'h1c87e6e1b2;
    stim[41] = 37'h1dcfab14da;
    stim[42] = 37'h1b388ffbc0;
    stim[43] = 37'h19190d35b5;
    stim[44] = 37'h1ce0c963c4;
    stim[45] = 37'h1255cfe4fd;
    stim[46] = 37'h154860c83e;
    stim[47] = 37'h1c6a663c8a;
    stim[48] = 37'h1b6579c1d1;
    stim[49] = 37'h182b22151e;
    stim[50] = 37'h159e5ce0fe;
    stim[51] = 37'h13d949de92;
    stim[52] = 37'h0193691f27;
    stim[53] = 37'h1a195652a7;
    stim[54] = 37'h1fe0ebae33;
    stim[55] = 37'h1199dcdae5;
    stim[56] = 37'h132f58361b;
    stim[57] = 37'h0dd338ec8b;
    stim[58] = 37'h1f6183c093;
    stim[59] = 37'h1923aeadcb;
    stim[60] = 37'h13dd770654;
    stim[61] = 37'h1e0dbcef7f;
    stim[62] = 37'h10081c22b2;
    stim[63] = 37'h1a161d8a8e;
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
      expv[0] = 2'hx;
      expv[1] = 2'h0;
      expv[2] = 2'h0;
      expv[3] = 2'h0;
      expv[4] = 2'h2;
      expv[5] = 2'h0;
      expv[6] = 2'h0;
      expv[7] = 2'h0;
      expv[8] = 2'h0;
      expv[9] = 2'h2;
      expv[10] = 2'h0;
      expv[11] = 2'h0;
      expv[12] = 2'h2;
      expv[13] = 2'h1;
      expv[14] = 2'h3;
      expv[15] = 2'h1;
      expv[16] = 2'h0;
      expv[17] = 2'h2;
      expv[18] = 2'h0;
      expv[19] = 2'h0;
      expv[20] = 2'h0;
      expv[21] = 2'h0;
      expv[22] = 2'h0;
      expv[23] = 2'h2;
      expv[24] = 2'h0;
      expv[25] = 2'h0;
      expv[26] = 2'h1;
      expv[27] = 2'h1;
      expv[28] = 2'h0;
      expv[29] = 2'h0;
      expv[30] = 2'h0;
      expv[31] = 2'h2;
      expv[32] = 2'h0;
      expv[33] = 2'h0;
      expv[34] = 2'h2;
      expv[35] = 2'h0;
      expv[36] = 2'h2;
      expv[37] = 2'h0;
      expv[38] = 2'h0;
      expv[39] = 2'h2;
      expv[40] = 2'h0;
      expv[41] = 2'h0;
      expv[42] = 2'h0;
      expv[43] = 2'h0;
      expv[44] = 2'h2;
      expv[45] = 2'h0;
      expv[46] = 2'h2;
      expv[47] = 2'h0;
      expv[48] = 2'h0;
      expv[49] = 2'h2;
      expv[50] = 2'h0;
      expv[51] = 2'h0;
      expv[52] = 2'h0;
      expv[53] = 2'h0;
      expv[54] = 2'h2;
      expv[55] = 2'h0;
      expv[56] = 2'h0;
      expv[57] = 2'h0;
      expv[58] = 2'h0;
      expv[59] = 2'h2;
      expv[60] = 2'h0;
      expv[61] = 2'h0;
      expv[62] = 2'h2;
      expv[63] = 2'h0;
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
