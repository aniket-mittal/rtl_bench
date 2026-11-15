// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 5;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_186915 dut (
    .instr(in_vec[31:0]),
    .reg_write(out_vec[4:4]),
    .mem_write(out_vec[3:3]),
    .mem_read(out_vec[2:2]),
    .mem2reg(out_vec[1:1]),
    .ALUSrc(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'h346102e3;
    stim[1] = 32'ha1d79d66;
    stim[2] = 32'h0cd51d58;
    stim[3] = 32'hd1d5f93b;
    stim[4] = 32'h23ee6361;
    stim[5] = 32'h704a0ad4;
    stim[6] = 32'haff1c8f5;
    stim[7] = 32'hb717f2fe;
    stim[8] = 32'h076ad0f1;
    stim[9] = 32'h5d30b78b;
    stim[10] = 32'ha7cca0ee;
    stim[11] = 32'hf62aaf33;
    stim[12] = 32'h3465a0ed;
    stim[13] = 32'h6bfc7be3;
    stim[14] = 32'ha8e94763;
    stim[15] = 32'h92b9cbe2;
    stim[16] = 32'h19dad0df;
    stim[17] = 32'h0ce4f04a;
    stim[18] = 32'hc46473bc;
    stim[19] = 32'hcf1d9790;
    stim[20] = 32'h338b9e81;
    stim[21] = 32'h72a45567;
    stim[22] = 32'h229835e7;
    stim[23] = 32'hc582f63a;
    stim[24] = 32'h892d17a9;
    stim[25] = 32'h7339b63a;
    stim[26] = 32'hdbb742fb;
    stim[27] = 32'h6431cc3e;
    stim[28] = 32'h0da2d794;
    stim[29] = 32'he7535ac9;
    stim[30] = 32'h2ff9fdfb;
    stim[31] = 32'h5ccf3fc1;
    stim[32] = 32'hc0a5e7aa;
    stim[33] = 32'hd08a5217;
    stim[34] = 32'h0bae36bb;
    stim[35] = 32'hb0018bd1;
    stim[36] = 32'h9cda21ab;
    stim[37] = 32'h1b427fb0;
    stim[38] = 32'h9ffb0582;
    stim[39] = 32'hcc6d9d9e;
    stim[40] = 32'h04d9acd9;
    stim[41] = 32'h5ad7aa1d;
    stim[42] = 32'h01365737;
    stim[43] = 32'h87efd9d5;
    stim[44] = 32'h1158d69b;
    stim[45] = 32'h534edc97;
    stim[46] = 32'h42fa1d99;
    stim[47] = 32'h2ad0834b;
    stim[48] = 32'h5208e886;
    stim[49] = 32'hb6e4e73d;
    stim[50] = 32'hc1cd6768;
    stim[51] = 32'hd6e0be12;
    stim[52] = 32'h958faa23;
    stim[53] = 32'hd74ba07e;
    stim[54] = 32'h758ebb41;
    stim[55] = 32'he73b8d4d;
    stim[56] = 32'ha6926ee5;
    stim[57] = 32'h93caacaf;
    stim[58] = 32'ha98a7bdf;
    stim[59] = 32'hdd11ae06;
    stim[60] = 32'h637813a3;
    stim[61] = 32'h7e382e42;
    stim[62] = 32'hf5dac602;
    stim[63] = 32'h91cb9ba8;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 5'h00;
      expv[1] = 5'h00;
      expv[2] = 5'h00;
      expv[3] = 5'h00;
      expv[4] = 5'h00;
      expv[5] = 5'h00;
      expv[6] = 5'h00;
      expv[7] = 5'h00;
      expv[8] = 5'h00;
      expv[9] = 5'h00;
      expv[10] = 5'h00;
      expv[11] = 5'h00;
      expv[12] = 5'h00;
      expv[13] = 5'h00;
      expv[14] = 5'h00;
      expv[15] = 5'h00;
      expv[16] = 5'h00;
      expv[17] = 5'h00;
      expv[18] = 5'h00;
      expv[19] = 5'h00;
      expv[20] = 5'h00;
      expv[21] = 5'h00;
      expv[22] = 5'h00;
      expv[23] = 5'h00;
      expv[24] = 5'h00;
      expv[25] = 5'h00;
      expv[26] = 5'h00;
      expv[27] = 5'h00;
      expv[28] = 5'h00;
      expv[29] = 5'h00;
      expv[30] = 5'h00;
      expv[31] = 5'h00;
      expv[32] = 5'h00;
      expv[33] = 5'h00;
      expv[34] = 5'h00;
      expv[35] = 5'h00;
      expv[36] = 5'h00;
      expv[37] = 5'h00;
      expv[38] = 5'h00;
      expv[39] = 5'h00;
      expv[40] = 5'h00;
      expv[41] = 5'h00;
      expv[42] = 5'h00;
      expv[43] = 5'h00;
      expv[44] = 5'h00;
      expv[45] = 5'h00;
      expv[46] = 5'h00;
      expv[47] = 5'h00;
      expv[48] = 5'h00;
      expv[49] = 5'h00;
      expv[50] = 5'h00;
      expv[51] = 5'h00;
      expv[52] = 5'h00;
      expv[53] = 5'h00;
      expv[54] = 5'h00;
      expv[55] = 5'h00;
      expv[56] = 5'h00;
      expv[57] = 5'h00;
      expv[58] = 5'h00;
      expv[59] = 5'h00;
      expv[60] = 5'h00;
      expv[61] = 5'h00;
      expv[62] = 5'h00;
      expv[63] = 5'h00;
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
