// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 40;
  localparam OW = 36;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_00661 dut (
    .mem_data_out(in_vec[39:8]),
    .mem_addr_in(in_vec[7:6]),
    .IR_out(in_vec[5:0]),
    .mem_data_shift(out_vec[35:4]),
    .Rd_write_byte_en(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 40'ha80d17d390;
    stim[1] = 40'h39c4f563c4;
    stim[2] = 40'hd5ebcff253;
    stim[3] = 40'h542a2bfb5c;
    stim[4] = 40'hac745be6f2;
    stim[5] = 40'hecdcbda828;
    stim[6] = 40'h7b3ccb926d;
    stim[7] = 40'hc0700f4f5a;
    stim[8] = 40'haf47290b56;
    stim[9] = 40'h750e29c40b;
    stim[10] = 40'h64c9a170a6;
    stim[11] = 40'hfb4e903e78;
    stim[12] = 40'h8fd6efda8b;
    stim[13] = 40'hee71367cdf;
    stim[14] = 40'hb4c952b582;
    stim[15] = 40'hab782808a5;
    stim[16] = 40'h04add852e0;
    stim[17] = 40'h018309eb4e;
    stim[18] = 40'h996c86e856;
    stim[19] = 40'h83b5915776;
    stim[20] = 40'hb9cfea7bf0;
    stim[21] = 40'h36a67496b0;
    stim[22] = 40'hd001aca8fa;
    stim[23] = 40'hb2d38ce942;
    stim[24] = 40'h9c1aedaf7c;
    stim[25] = 40'h256c9b5db5;
    stim[26] = 40'h3ac2f0a4e5;
    stim[27] = 40'h2e724701e1;
    stim[28] = 40'h00b7a314e6;
    stim[29] = 40'hff710cfee7;
    stim[30] = 40'h326a86bbde;
    stim[31] = 40'hf8c329831c;
    stim[32] = 40'h75cf120cc2;
    stim[33] = 40'h071e7381fe;
    stim[34] = 40'h5bcf24ede0;
    stim[35] = 40'h9ff3bd6103;
    stim[36] = 40'h5e361a9a06;
    stim[37] = 40'h4c8a20897c;
    stim[38] = 40'hc1da5e593e;
    stim[39] = 40'h793716c5d8;
    stim[40] = 40'haa6ef939ef;
    stim[41] = 40'h32c2619e10;
    stim[42] = 40'h2ffdfdc0d2;
    stim[43] = 40'h3b95969edf;
    stim[44] = 40'hde3e7bd917;
    stim[45] = 40'h3bdb249788;
    stim[46] = 40'h2ac1aee300;
    stim[47] = 40'h867931ec80;
    stim[48] = 40'ha1bcf4acfb;
    stim[49] = 40'h6e1437eda3;
    stim[50] = 40'h39f85ea8b9;
    stim[51] = 40'heb8ff50215;
    stim[52] = 40'hd54af8409b;
    stim[53] = 40'hb752263a61;
    stim[54] = 40'h90fccabc6f;
    stim[55] = 40'h86a8e7ba79;
    stim[56] = 40'h17c8576f64;
    stim[57] = 40'h6f965dd123;
    stim[58] = 40'hf5498a8c8e;
    stim[59] = 40'h8efaaab21c;
    stim[60] = 40'he38d404c78;
    stim[61] = 40'he49f54c32e;
    stim[62] = 40'h31cad5326b;
    stim[63] = 40'h4a60611954;
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
      expv[0] = 36'h17d30000c;
      expv[1] = 36'h630000008;
      expv[2] = 36'hebcff200e;
      expv[3] = 36'h2a2bfb00e;
      expv[4] = 36'he60000008;
      expv[5] = 36'hecdcbda8f;
      expv[6] = 36'h3ccb9200e;
      expv[7] = 36'h700f4f00e;
      expv[8] = 36'h47290b00e;
      expv[9] = 36'h750e29c4f;
      expv[10] = 36'ha1700000c;
      expv[11] = 36'h4e903e00e;
      expv[12] = 36'hefda0000c;
      expv[13] = 36'h7c0000008;
      expv[14] = 36'h52b50000c;
      expv[15] = 36'h28080000c;
      expv[16] = 36'h520000008;
      expv[17] = 36'h8309eb00e;
      expv[18] = 36'h6c86e800e;
      expv[19] = 36'hb5915700e;
      expv[20] = 36'h7b0000008;
      expv[21] = 36'h74960000c;
      expv[22] = 36'ha80000008;
      expv[23] = 36'hd38ce900e;
      expv[24] = 36'h1aedaf00e;
      expv[25] = 36'h9b5d0000c;
      expv[26] = 36'ha40000008;
      expv[27] = 36'h010000008;
      expv[28] = 36'h140000008;
      expv[29] = 36'hfe0000008;
      expv[30] = 36'hbb0000008;
      expv[31] = 36'hf8c32983f;
      expv[32] = 36'h0c0000008;
      expv[33] = 36'h810000008;
      expv[34] = 36'hed0000008;
      expv[35] = 36'h9ff3bd61f;
      expv[36] = 36'h5e361a9af;
      expv[37] = 36'h8a208900e;
      expv[38] = 36'hc1da5e59f;
      expv[39] = 36'hc50000008;
      expv[40] = 36'h390000008;
      expv[41] = 36'h32c2619ef;
      expv[42] = 36'hc00000008;
      expv[43] = 36'h9e0000008;
      expv[44] = 36'hde3e7bd9f;
      expv[45] = 36'h24970000c;
      expv[46] = 36'h2ac1aee3f;
      expv[47] = 36'h31ec0000c;
      expv[48] = 36'hac0000008;
      expv[49] = 36'h6e1437edf;
      expv[50] = 36'h5ea80000c;
      expv[51] = 36'heb8ff502f;
      expv[52] = 36'hf8400000c;
      expv[53] = 36'h52263a00e;
      expv[54] = 36'hfccabc00e;
      expv[55] = 36'ha8e7ba00e;
      expv[56] = 36'hc8576f00e;
      expv[57] = 36'h6f965dd1f;
      expv[58] = 36'h8a8c0000c;
      expv[59] = 36'h8efaaab2f;
      expv[60] = 36'h8d404c00e;
      expv[61] = 36'he49f54c3f;
      expv[62] = 36'hcad53200e;
      expv[63] = 36'h60611900e;
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
