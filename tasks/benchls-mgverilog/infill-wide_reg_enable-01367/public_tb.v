// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 33;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_01367 dut (
    .clk(clk),
    .we(in_vec[32:32]),
    .din(in_vec[31:0]),
    .dout(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 33'h065e8f118;
    stim[1] = 33'h1f7eaaea3;
    stim[2] = 33'h0f5d67f87;
    stim[3] = 33'h02509b57a;
    stim[4] = 33'h193d4db76;
    stim[5] = 33'h0b90733be;
    stim[6] = 33'h19ccb2de3;
    stim[7] = 33'h1c74b83ca;
    stim[8] = 33'h0e463bfec;
    stim[9] = 33'h0b82ba7d5;
    stim[10] = 33'h08fbe14c6;
    stim[11] = 33'h0e7425539;
    stim[12] = 33'h056da9514;
    stim[13] = 33'h101c10f7f;
    stim[14] = 33'h17e976bc7;
    stim[15] = 33'h0c8957acb;
    stim[16] = 33'h0c911f606;
    stim[17] = 33'h10fee2817;
    stim[18] = 33'h1c4fa7f2e;
    stim[19] = 33'h0762fa2f0;
    stim[20] = 33'h0861ccec2;
    stim[21] = 33'h01210af48;
    stim[22] = 33'h1a63dc2b7;
    stim[23] = 33'h0eb03a123;
    stim[24] = 33'h19a97563a;
    stim[25] = 33'h034691902;
    stim[26] = 33'h0934ca4d9;
    stim[27] = 33'h1a6a24df8;
    stim[28] = 33'h1cd5e74b3;
    stim[29] = 33'h0110ffc9c;
    stim[30] = 33'h117526c3f;
    stim[31] = 33'h08a818bca;
    stim[32] = 33'h160a19359;
    stim[33] = 33'h1d955f158;
    stim[34] = 33'h19e2e94ad;
    stim[35] = 33'h0d9c37aee;
    stim[36] = 33'h06741b977;
    stim[37] = 33'h12b3bf9a7;
    stim[38] = 33'h1282fc0fe;
    stim[39] = 33'h12cbd8f8c;
    stim[40] = 33'h13f73ae41;
    stim[41] = 33'h02d0e0107;
    stim[42] = 33'h07a8548fc;
    stim[43] = 33'h00d09499d;
    stim[44] = 33'h0da0d2dab;
    stim[45] = 33'h1de0fe2cc;
    stim[46] = 33'h142058c8e;
    stim[47] = 33'h1b9dc1535;
    stim[48] = 33'h10d38ed46;
    stim[49] = 33'h08f6d2866;
    stim[50] = 33'h10df64025;
    stim[51] = 33'h15502de09;
    stim[52] = 33'h0f9924d82;
    stim[53] = 33'h11b2dd19f;
    stim[54] = 33'h018a04858;
    stim[55] = 33'h01454d420;
    stim[56] = 33'h08a327677;
    stim[57] = 33'h0a700518d;
    stim[58] = 33'h10b8a1a29;
    stim[59] = 33'h19cda4ca9;
    stim[60] = 33'h0a75673b1;
    stim[61] = 33'h133729d09;
    stim[62] = 33'h08fce5aca;
    stim[63] = 33'h002028f14;
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
      expv[0] = 32'hxxxxxxxx;
      expv[1] = 32'hxxxxxxxx;
      expv[2] = 32'hf7eaaea3;
      expv[3] = 32'hf7eaaea3;
      expv[4] = 32'hf7eaaea3;
      expv[5] = 32'h93d4db76;
      expv[6] = 32'h93d4db76;
      expv[7] = 32'h9ccb2de3;
      expv[8] = 32'hc74b83ca;
      expv[9] = 32'hc74b83ca;
      expv[10] = 32'hc74b83ca;
      expv[11] = 32'hc74b83ca;
      expv[12] = 32'hc74b83ca;
      expv[13] = 32'hc74b83ca;
      expv[14] = 32'h01c10f7f;
      expv[15] = 32'h7e976bc7;
      expv[16] = 32'h7e976bc7;
      expv[17] = 32'h7e976bc7;
      expv[18] = 32'h0fee2817;
      expv[19] = 32'hc4fa7f2e;
      expv[20] = 32'hc4fa7f2e;
      expv[21] = 32'hc4fa7f2e;
      expv[22] = 32'hc4fa7f2e;
      expv[23] = 32'ha63dc2b7;
      expv[24] = 32'ha63dc2b7;
      expv[25] = 32'h9a97563a;
      expv[26] = 32'h9a97563a;
      expv[27] = 32'h9a97563a;
      expv[28] = 32'ha6a24df8;
      expv[29] = 32'hcd5e74b3;
      expv[30] = 32'hcd5e74b3;
      expv[31] = 32'h17526c3f;
      expv[32] = 32'h17526c3f;
      expv[33] = 32'h60a19359;
      expv[34] = 32'hd955f158;
      expv[35] = 32'h9e2e94ad;
      expv[36] = 32'h9e2e94ad;
      expv[37] = 32'h9e2e94ad;
      expv[38] = 32'h2b3bf9a7;
      expv[39] = 32'h282fc0fe;
      expv[40] = 32'h2cbd8f8c;
      expv[41] = 32'h3f73ae41;
      expv[42] = 32'h3f73ae41;
      expv[43] = 32'h3f73ae41;
      expv[44] = 32'h3f73ae41;
      expv[45] = 32'h3f73ae41;
      expv[46] = 32'hde0fe2cc;
      expv[47] = 32'h42058c8e;
      expv[48] = 32'hb9dc1535;
      expv[49] = 32'h0d38ed46;
      expv[50] = 32'h0d38ed46;
      expv[51] = 32'h0df64025;
      expv[52] = 32'h5502de09;
      expv[53] = 32'h5502de09;
      expv[54] = 32'h1b2dd19f;
      expv[55] = 32'h1b2dd19f;
      expv[56] = 32'h1b2dd19f;
      expv[57] = 32'h1b2dd19f;
      expv[58] = 32'h1b2dd19f;
      expv[59] = 32'h0b8a1a29;
      expv[60] = 32'h9cda4ca9;
      expv[61] = 32'h9cda4ca9;
      expv[62] = 32'h33729d09;
      expv[63] = 32'h33729d09;
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
