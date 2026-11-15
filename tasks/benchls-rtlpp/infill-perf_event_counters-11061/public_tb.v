// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 39;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_11061 dut (
    .clk(clk),
    .address(in_vec[38:35]),
    .begintransfer(in_vec[34:34]),
    .reset_n(in_vec[33:33]),
    .write(in_vec[32:32]),
    .writedata(in_vec[31:0]),
    .readdata(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 39'h70e0006b07;
    stim[1] = 39'h348cd003d2;
    stim[2] = 39'h22c35b5795;
    stim[3] = 39'h33b29881af;
    stim[4] = 39'h42fe041ea1;
    stim[5] = 39'h4ab46e9833;
    stim[6] = 39'h2a0a16c009;
    stim[7] = 39'h434728cb1a;
    stim[8] = 39'h27aa8dd866;
    stim[9] = 39'h2bb8a6fa70;
    stim[10] = 39'h239f2b6238;
    stim[11] = 39'h62302a0f86;
    stim[12] = 39'h7e9ed6337e;
    stim[13] = 39'h4b0ead4419;
    stim[14] = 39'h6e02936951;
    stim[15] = 39'h26fd834ec4;
    stim[16] = 39'h6be3f3d7db;
    stim[17] = 39'h6b2496b72a;
    stim[18] = 39'h7f2fbb3c57;
    stim[19] = 39'h5a731c2583;
    stim[20] = 39'h5b7050b991;
    stim[21] = 39'h46326df123;
    stim[22] = 39'h12ad4da537;
    stim[23] = 39'h0ab853fe85;
    stim[24] = 39'h4e77fc8d86;
    stim[25] = 39'h15d6733d87;
    stim[26] = 39'h279c930f98;
    stim[27] = 39'h7f3ae07bfc;
    stim[28] = 39'h1e155127f9;
    stim[29] = 39'h4f61308634;
    stim[30] = 39'h261662f315;
    stim[31] = 39'h37199ca962;
    stim[32] = 39'h2643ba8528;
    stim[33] = 39'h7e8a498dae;
    stim[34] = 39'h23a2c431ae;
    stim[35] = 39'h63d163f1db;
    stim[36] = 39'h5f3044d8ed;
    stim[37] = 39'h429514dccd;
    stim[38] = 39'h1cd0e9bbd7;
    stim[39] = 39'h13391a5d4d;
    stim[40] = 39'h6f00f51b48;
    stim[41] = 39'h2e7268cacd;
    stim[42] = 39'h3b345f767a;
    stim[43] = 39'h36ea5e0119;
    stim[44] = 39'h5307fe1bbf;
    stim[45] = 39'h63d2ddf266;
    stim[46] = 39'h22e904569a;
    stim[47] = 39'h2e01e68e35;
    stim[48] = 39'h2ba5d90aa4;
    stim[49] = 39'h46ad674a97;
    stim[50] = 39'h5bd3af19ea;
    stim[51] = 39'h4b7566508d;
    stim[52] = 39'h2f82fb385e;
    stim[53] = 39'h5280302ada;
    stim[54] = 39'h4a578f2142;
    stim[55] = 39'h66e9a2571e;
    stim[56] = 39'h56ca6d8725;
    stim[57] = 39'h37891b993e;
    stim[58] = 39'h27ddaf1d91;
    stim[59] = 39'h0fd1b33c6a;
    stim[60] = 39'h2e7e0d8f43;
    stim[61] = 39'h0a19458e39;
    stim[62] = 39'h2b874fdc26;
    stim[63] = 39'h02207686a7;
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
      expv[0] = 32'h00000000;
      expv[1] = 32'h00000000;
      expv[2] = 32'h00000000;
      expv[3] = 32'h00000000;
      expv[4] = 32'h00000000;
      expv[5] = 32'h00000000;
      expv[6] = 32'h00000000;
      expv[7] = 32'h00000000;
      expv[8] = 32'h00000000;
      expv[9] = 32'h00000000;
      expv[10] = 32'h00000000;
      expv[11] = 32'h00000000;
      expv[12] = 32'h00000000;
      expv[13] = 32'h00000000;
      expv[14] = 32'h00000000;
      expv[15] = 32'h00000000;
      expv[16] = 32'h00000000;
      expv[17] = 32'h00000000;
      expv[18] = 32'h00000000;
      expv[19] = 32'h00000000;
      expv[20] = 32'h00000000;
      expv[21] = 32'h00000000;
      expv[22] = 32'h00000000;
      expv[23] = 32'h00000000;
      expv[24] = 32'h00000000;
      expv[25] = 32'h00000000;
      expv[26] = 32'h00000000;
      expv[27] = 32'h00000000;
      expv[28] = 32'h00000000;
      expv[29] = 32'h00000000;
      expv[30] = 32'h00000000;
      expv[31] = 32'h00000000;
      expv[32] = 32'h00000000;
      expv[33] = 32'h00000000;
      expv[34] = 32'h00000000;
      expv[35] = 32'h00000000;
      expv[36] = 32'h00000000;
      expv[37] = 32'h00000000;
      expv[38] = 32'h00000000;
      expv[39] = 32'h00000000;
      expv[40] = 32'h00000000;
      expv[41] = 32'h00000000;
      expv[42] = 32'h00000000;
      expv[43] = 32'h00000000;
      expv[44] = 32'h00000000;
      expv[45] = 32'h00000000;
      expv[46] = 32'h00000000;
      expv[47] = 32'h00000000;
      expv[48] = 32'h00000000;
      expv[49] = 32'h00000000;
      expv[50] = 32'h00000000;
      expv[51] = 32'h00000000;
      expv[52] = 32'h00000000;
      expv[53] = 32'h00000000;
      expv[54] = 32'h00000000;
      expv[55] = 32'h00000000;
      expv[56] = 32'h00000000;
      expv[57] = 32'h00000000;
      expv[58] = 32'h00000000;
      expv[59] = 32'h00000000;
      expv[60] = 32'h00000000;
      expv[61] = 32'h00000000;
      expv[62] = 32'h00000000;
      expv[63] = 32'h00000000;
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
