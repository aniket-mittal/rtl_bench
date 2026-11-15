// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_00407 dut (
    .clk(clk),
    .rst_n(in_vec[9:9]),
    .data(in_vec[8:1]),
    .crc_en(in_vec[0:0]),
    .crc32(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h09b;
    stim[1] = 10'h121;
    stim[2] = 10'h33c;
    stim[3] = 10'h398;
    stim[4] = 10'h32f;
    stim[5] = 10'h3f0;
    stim[6] = 10'h398;
    stim[7] = 10'h3b2;
    stim[8] = 10'h2e1;
    stim[9] = 10'h3a4;
    stim[10] = 10'h2cc;
    stim[11] = 10'h283;
    stim[12] = 10'h282;
    stim[13] = 10'h2e9;
    stim[14] = 10'h3e1;
    stim[15] = 10'h3e0;
    stim[16] = 10'h391;
    stim[17] = 10'h3a2;
    stim[18] = 10'h2e0;
    stim[19] = 10'h206;
    stim[20] = 10'h3d9;
    stim[21] = 10'h2b6;
    stim[22] = 10'h3d6;
    stim[23] = 10'h322;
    stim[24] = 10'h38b;
    stim[25] = 10'h3c8;
    stim[26] = 10'h3f0;
    stim[27] = 10'h215;
    stim[28] = 10'h1f5;
    stim[29] = 10'h325;
    stim[30] = 10'h333;
    stim[31] = 10'h26d;
    stim[32] = 10'h39e;
    stim[33] = 10'h281;
    stim[34] = 10'h20b;
    stim[35] = 10'h208;
    stim[36] = 10'h2d5;
    stim[37] = 10'h2d3;
    stim[38] = 10'h3d8;
    stim[39] = 10'h33d;
    stim[40] = 10'h3f5;
    stim[41] = 10'h381;
    stim[42] = 10'h3b7;
    stim[43] = 10'h379;
    stim[44] = 10'h2ec;
    stim[45] = 10'h3ce;
    stim[46] = 10'h2e5;
    stim[47] = 10'h39e;
    stim[48] = 10'h30b;
    stim[49] = 10'h289;
    stim[50] = 10'h2a4;
    stim[51] = 10'h30c;
    stim[52] = 10'h33a;
    stim[53] = 10'h3b7;
    stim[54] = 10'h290;
    stim[55] = 10'h33c;
    stim[56] = 10'h3a8;
    stim[57] = 10'h2b3;
    stim[58] = 10'h3ac;
    stim[59] = 10'h210;
    stim[60] = 10'h353;
    stim[61] = 10'h2eb;
    stim[62] = 10'h2e7;
    stim[63] = 10'h343;
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
      expv[0] = 32'hffffffff;
      expv[1] = 32'hffffffff;
      expv[2] = 32'hffffffff;
      expv[3] = 32'hffffffff;
      expv[4] = 32'hffffffff;
      expv[5] = 32'h7552d42f;
      expv[6] = 32'h7552d42f;
      expv[7] = 32'h7552d42f;
      expv[8] = 32'h7552d42f;
      expv[9] = 32'h4511446b;
      expv[10] = 32'h4511446b;
      expv[11] = 32'h4511446b;
      expv[12] = 32'h02401ddc;
      expv[13] = 32'h02401ddc;
      expv[14] = 32'hba2f8c55;
      expv[15] = 32'h3480f3a1;
      expv[16] = 32'h3480f3a1;
      expv[17] = 32'h3c47c76d;
      expv[18] = 32'h3c47c76d;
      expv[19] = 32'h3c47c76d;
      expv[20] = 32'h3c47c76d;
      expv[21] = 32'h565c26e9;
      expv[22] = 32'h565c26e9;
      expv[23] = 32'h565c26e9;
      expv[24] = 32'h565c26e9;
      expv[25] = 32'h7478f447;
      expv[26] = 32'h7478f447;
      expv[27] = 32'h7478f447;
      expv[28] = 32'hffffffff;
      expv[29] = 32'hffffffff;
      expv[30] = 32'h6297bf44;
      expv[31] = 32'h354c7268;
      expv[32] = 32'h41314ed9;
      expv[33] = 32'h41314ed9;
      expv[34] = 32'h358fc4b7;
      expv[35] = 32'h5bf6da90;
      expv[36] = 32'h5bf6da90;
      expv[37] = 32'h2629e027;
      expv[38] = 32'h2529eaca;
      expv[39] = 32'h2529eaca;
      expv[40] = 32'hbf9f8c1f;
      expv[41] = 32'hbccf041c;
      expv[42] = 32'h1abc9a83;
      expv[43] = 32'he5d10e2e;
      expv[44] = 32'h8b507508;
      expv[45] = 32'h8b507508;
      expv[46] = 32'h8b507508;
      expv[47] = 32'hfb040506;
      expv[48] = 32'hfb040506;
      expv[49] = 32'hd83fbbed;
      expv[50] = 32'h2faa4dfa;
      expv[51] = 32'h2faa4dfa;
      expv[52] = 32'h2faa4dfa;
      expv[53] = 32'h2faa4dfa;
      expv[54] = 32'h30f171d5;
      expv[55] = 32'h30f171d5;
      expv[56] = 32'h30f171d5;
      expv[57] = 32'h30f171d5;
      expv[58] = 32'h7f1de398;
      expv[59] = 32'h7f1de398;
      expv[60] = 32'h7f1de398;
      expv[61] = 32'h16fe9e5b;
      expv[62] = 32'h5f78bb4e;
      expv[63] = 32'hd5946384;
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
