// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 20;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_006185 dut (
    .clk(clk),
    .rst_n(in_vec[19:19]),
    .opcode(in_vec[18:16]),
    .dina(in_vec[15:8]),
    .dinb(in_vec[7:0]),
    .cout(out_vec[8:8]),
    .dout(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 20'h39d00;
    stim[1] = 20'h7d340;
    stim[2] = 20'h9a7b6;
    stim[3] = 20'h9cbf9;
    stim[4] = 20'hc0815;
    stim[5] = 20'hf6749;
    stim[6] = 20'h9432b;
    stim[7] = 20'hd4de6;
    stim[8] = 20'he62b0;
    stim[9] = 20'hd96f8;
    stim[10] = 20'h846ba;
    stim[11] = 20'hfc90c;
    stim[12] = 20'hcd83d;
    stim[13] = 20'hdd42d;
    stim[14] = 20'hfd6f4;
    stim[15] = 20'had01c;
    stim[16] = 20'h9e8dd;
    stim[17] = 20'ha5ac3;
    stim[18] = 20'hc4e3b;
    stim[19] = 20'he1e77;
    stim[20] = 20'h82973;
    stim[21] = 20'h7301e;
    stim[22] = 20'hec88d;
    stim[23] = 20'he8e18;
    stim[24] = 20'hcb931;
    stim[25] = 20'h9b2b3;
    stim[26] = 20'hb7d64;
    stim[27] = 20'h8575c;
    stim[28] = 20'hecffb;
    stim[29] = 20'hc42e4;
    stim[30] = 20'h9b879;
    stim[31] = 20'h98bfa;
    stim[32] = 20'he3b1f;
    stim[33] = 20'hfb0b7;
    stim[34] = 20'he9a17;
    stim[35] = 20'h988c4;
    stim[36] = 20'hde70c;
    stim[37] = 20'hb2af2;
    stim[38] = 20'hb5670;
    stim[39] = 20'ha202c;
    stim[40] = 20'hdcaa4;
    stim[41] = 20'h8e6ca;
    stim[42] = 20'he4357;
    stim[43] = 20'h809ea;
    stim[44] = 20'hc9832;
    stim[45] = 20'he5ad3;
    stim[46] = 20'h99d1b;
    stim[47] = 20'hd075e;
    stim[48] = 20'hf9e46;
    stim[49] = 20'hde063;
    stim[50] = 20'he62bc;
    stim[51] = 20'h1c4e3;
    stim[52] = 20'h9e8e1;
    stim[53] = 20'h827b7;
    stim[54] = 20'hfc4cb;
    stim[55] = 20'he9d5d;
    stim[56] = 20'h9bde3;
    stim[57] = 20'h86b69;
    stim[58] = 20'h8e0de;
    stim[59] = 20'hccc3d;
    stim[60] = 20'hd8b4f;
    stim[61] = 20'hb624c;
    stim[62] = 20'hc46a7;
    stim[63] = 20'hd1937;
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
      expv[0] = 9'h000;
      expv[1] = 9'h000;
      expv[2] = 9'h000;
      expv[3] = 9'h00f;
      expv[4] = 9'h02e;
      expv[5] = 9'h01d;
      expv[6] = 9'h000;
      expv[7] = 9'h018;
      expv[8] = 9'h040;
      expv[9] = 9'h062;
      expv[10] = 9'h096;
      expv[11] = 9'h100;
      expv[12] = 9'h000;
      expv[13] = 9'h0e5;
      expv[14] = 9'h080;
      expv[15] = 9'h000;
      expv[16] = 9'h010;
      expv[17] = 9'h00b;
      expv[18] = 9'h042;
      expv[19] = 9'h075;
      expv[20] = 9'h000;
      expv[21] = 9'h000;
      expv[22] = 9'h000;
      expv[23] = 9'h006;
      expv[24] = 9'h08e;
      expv[25] = 9'h088;
      expv[26] = 9'h001;
      expv[27] = 9'h07d;
      expv[28] = 9'h0b3;
      expv[29] = 9'h019;
      expv[30] = 9'h0a6;
      expv[31] = 9'h03f;
      expv[32] = 9'h06f;
      expv[33] = 9'h000;
      expv[34] = 9'h000;
      expv[35] = 9'h001;
      expv[36] = 9'h03c;
      expv[37] = 9'h070;
      expv[38] = 9'h0fa;
      expv[39] = 9'h076;
      expv[40] = 9'h020;
      expv[41] = 9'h0a0;
      expv[42] = 9'h1b0;
      expv[43] = 9'h000;
      expv[44] = 9'h0f3;
      expv[45] = 9'h0aa;
      expv[46] = 9'h00b;
      expv[47] = 9'h082;
      expv[48] = 9'h0c0;
      expv[49] = 9'h000;
      expv[50] = 9'h000;
      expv[51] = 9'h000;
      expv[52] = 9'h000;
      expv[53] = 9'h007;
      expv[54] = 9'h0de;
      expv[55] = 9'h000;
      expv[56] = 9'h004;
      expv[57] = 9'h026;
      expv[58] = 9'h0d4;
      expv[59] = 9'h1be;
      expv[60] = 9'h0f1;
      expv[61] = 9'h080;
      expv[62] = 9'h06e;
      expv[63] = 9'h0e1;
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
