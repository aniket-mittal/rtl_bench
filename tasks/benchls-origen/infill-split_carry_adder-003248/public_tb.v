// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 40;
  localparam OW = 20;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_003248 dut (
    .a(in_vec[39:20]),
    .b(in_vec[19:0]),
    .o(out_vec[19:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 40'hc28c74a207;
    stim[1] = 40'h96c19c78bb;
    stim[2] = 40'h6bdcff9b0a;
    stim[3] = 40'hceb48a3a22;
    stim[4] = 40'h4b37897ace;
    stim[5] = 40'hd4c22573fe;
    stim[6] = 40'hc698dbb414;
    stim[7] = 40'h6ce49dc07c;
    stim[8] = 40'h89a4722293;
    stim[9] = 40'h51b6dd9d7f;
    stim[10] = 40'he7a6930ce5;
    stim[11] = 40'hee03fb17fe;
    stim[12] = 40'hf709bb816d;
    stim[13] = 40'hd4fb0f135d;
    stim[14] = 40'h27b4709410;
    stim[15] = 40'hb132f9f86e;
    stim[16] = 40'he4a7f558cb;
    stim[17] = 40'h2031eadfdf;
    stim[18] = 40'h2d19c64b13;
    stim[19] = 40'hb4e4382a38;
    stim[20] = 40'h03fc185ea8;
    stim[21] = 40'ha70c767fda;
    stim[22] = 40'h20a927bf72;
    stim[23] = 40'h758b7b5417;
    stim[24] = 40'hc4629ae816;
    stim[25] = 40'h98e4fcd22c;
    stim[26] = 40'h75d7acbf12;
    stim[27] = 40'h9582e6994c;
    stim[28] = 40'h48fe860a9e;
    stim[29] = 40'h58a7b5a217;
    stim[30] = 40'h061401ff24;
    stim[31] = 40'ha4ab4025bc;
    stim[32] = 40'hb3cc0818e1;
    stim[33] = 40'h376cb1bacc;
    stim[34] = 40'hc076356c0d;
    stim[35] = 40'hb79612112d;
    stim[36] = 40'h40899abc7b;
    stim[37] = 40'h53f80443fd;
    stim[38] = 40'h350d76a2e6;
    stim[39] = 40'h847720d68b;
    stim[40] = 40'h97950fa748;
    stim[41] = 40'h6c0b1c55a7;
    stim[42] = 40'h588bd6764f;
    stim[43] = 40'hde3d5775b6;
    stim[44] = 40'h41240d36c9;
    stim[45] = 40'hf8e6bdf2d9;
    stim[46] = 40'h6712e8fe7c;
    stim[47] = 40'h2825c13770;
    stim[48] = 40'haddee68e03;
    stim[49] = 40'h9136001fd8;
    stim[50] = 40'hb40c38c938;
    stim[51] = 40'h784fd6975a;
    stim[52] = 40'h50dcd02818;
    stim[53] = 40'h803f43a6b6;
    stim[54] = 40'ha45d911cc9;
    stim[55] = 40'h4d1410540e;
    stim[56] = 40'h0f70cc1d0b;
    stim[57] = 40'h2798bc4668;
    stim[58] = 40'h484ad8c89a;
    stim[59] = 40'h9d3b38fe52;
    stim[60] = 40'hdec4bb6501;
    stim[61] = 40'hdec63608d4;
    stim[62] = 40'hed49bbfeb4;
    stim[63] = 40'h289dfa9cc6;
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
      expv[0] = 20'h0cace;
      expv[1] = 20'h5e4d4;
      expv[2] = 20'h658d9;
      expv[3] = 20'h7256a;
      expv[4] = 20'he2e46;
      expv[5] = 20'h2c020;
      expv[6] = 20'h81da1;
      expv[7] = 20'h48ec5;
      expv[8] = 20'habcda;
      expv[9] = 20'h2b8ec;
      expv[10] = 20'h1874e;
      expv[11] = 20'h9f83d;
      expv[12] = 20'haf208;
      expv[13] = 20'hc630d;
      expv[14] = 20'h30f57;
      expv[15] = 20'h50b9d;
      expv[16] = 20'h3a34a;
      expv[17] = 20'hce2fd;
      expv[18] = 20'h91caf;
      expv[19] = 20'h3787b;
      expv[20] = 20'h89e69;
      expv[21] = 20'h0f0a1;
      expv[22] = 20'h9ca04;
      expv[23] = 20'h2acce;
      expv[24] = 20'h72e3f;
      expv[25] = 20'h6607b;
      expv[26] = 20'h41c8c;
      expv[27] = 20'hff17a;
      expv[28] = 20'ha9a86;
      expv[29] = 20'hb2c92;
      expv[30] = 20'h26064;
      expv[31] = 20'ha7070;
      expv[32] = 20'h355a1;
      expv[33] = 20'h53197;
      expv[34] = 20'h17370;
      expv[35] = 20'hd8a8e;
      expv[36] = 20'hec514;
      expv[37] = 20'h9837d;
      expv[38] = 20'h9f3bd;
      expv[39] = 20'h91dfd;
      expv[40] = 20'h92098;
      expv[41] = 20'h31658;
      expv[42] = 20'hbff0c;
      expv[43] = 20'h5598b;
      expv[44] = 20'h14909;
      expv[45] = 20'hd8144;
      expv[46] = 20'hf6faa;
      expv[47] = 20'h3b9cc;
      expv[48] = 20'h16bf1;
      expv[49] = 20'h93338;
      expv[50] = 20'h409fb;
      expv[51] = 20'he1c57;
      expv[52] = 20'h535e5;
      expv[53] = 20'hbaaaa;
      expv[54] = 20'hb62a2;
      expv[55] = 20'h5254f;
      expv[56] = 20'hd1417;
      expv[57] = 20'hebff3;
      expv[58] = 20'hd4d47;
      expv[59] = 20'h2d205;
      expv[60] = 20'h9514c;
      expv[61] = 20'h3f537;
      expv[62] = 20'had34f;
      expv[63] = 20'hd26a5;
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
