// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 64;
  localparam OW = 6;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  ct_rtu_encode_64 dut (
    .x_num_expand(in_vec[63:0]),
    .x_num(out_vec[5:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 64'hfe976e259fb9120e;
    stim[1] = 64'h1eda7ec10bdca19c;
    stim[2] = 64'h40667354c4973352;
    stim[3] = 64'hacbecc3782efcfa4;
    stim[4] = 64'h32cbf402a9c4ad88;
    stim[5] = 64'ha02443108e3b27d8;
    stim[6] = 64'hf18a9f20f0396d97;
    stim[7] = 64'h6ecf7263adef6750;
    stim[8] = 64'h6bf3261e74fff7bf;
    stim[9] = 64'h8e63a9842bdd8360;
    stim[10] = 64'ha04d436e26b478d1;
    stim[11] = 64'hf45775deb9ba4634;
    stim[12] = 64'h57ede8893f2d619a;
    stim[13] = 64'h86e37ebf53b692f9;
    stim[14] = 64'h4e569ea4647a37a0;
    stim[15] = 64'h47fc53a4ed2c8824;
    stim[16] = 64'h363567f088860962;
    stim[17] = 64'h1c61209c2e78a9bd;
    stim[18] = 64'h5cb19da4561d5824;
    stim[19] = 64'ha3b2f33059144e92;
    stim[20] = 64'he401adfa83bf28b8;
    stim[21] = 64'h0d88c96e9d72bf7c;
    stim[22] = 64'hefb4338cf776b036;
    stim[23] = 64'hc92813237a271143;
    stim[24] = 64'h00f40cf3af5b1098;
    stim[25] = 64'h07f144dd602745bd;
    stim[26] = 64'h8990ab65590012ef;
    stim[27] = 64'h799d33fd7de862b6;
    stim[28] = 64'he97197e18bccda97;
    stim[29] = 64'hab657c7c480ec805;
    stim[30] = 64'hfa98b1265b9b8494;
    stim[31] = 64'h3c4edc2576327ef8;
    stim[32] = 64'h752983a012738cec;
    stim[33] = 64'h2d153b56d429cb88;
    stim[34] = 64'he894135912581749;
    stim[35] = 64'h0d6c943a7117d9d6;
    stim[36] = 64'h87344e98c5d36c1e;
    stim[37] = 64'h07e8d31abac843ff;
    stim[38] = 64'hde26d0bfb1ae9d75;
    stim[39] = 64'h2d35fc6eda471d06;
    stim[40] = 64'hb8857decd07cfea4;
    stim[41] = 64'h4da3b683f4d7c0f0;
    stim[42] = 64'h8044e4dfd513f4ba;
    stim[43] = 64'hc66dc241d1da008d;
    stim[44] = 64'h5d06db2e4da2e749;
    stim[45] = 64'h64a33b21035a13c1;
    stim[46] = 64'h9fa9985beba82de0;
    stim[47] = 64'h95c2b287edf89bdb;
    stim[48] = 64'hfe1cd829f2da5ecc;
    stim[49] = 64'hd7693a0d2abd8822;
    stim[50] = 64'h95b162fd584793b3;
    stim[51] = 64'hdbb28fda4557e5dc;
    stim[52] = 64'hcf224c8c64f8d77d;
    stim[53] = 64'hfd11edc092508750;
    stim[54] = 64'h81c8389b5401123a;
    stim[55] = 64'h6d4b0285589624ea;
    stim[56] = 64'h681f7c0c1cded1b0;
    stim[57] = 64'hdfcc2262ad134da4;
    stim[58] = 64'h19f531563b0a867b;
    stim[59] = 64'ha86a29b41cc7110f;
    stim[60] = 64'h8ee7e82b6c30fd3c;
    stim[61] = 64'hb001e193606efe33;
    stim[62] = 64'hdbbb53c86a010662;
    stim[63] = 64'hd8f16fd7e9185a0b;
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
      expv[0] = 6'h3f;
      expv[1] = 6'h3f;
      expv[2] = 6'h3f;
      expv[3] = 6'h3f;
      expv[4] = 6'h3f;
      expv[5] = 6'h3f;
      expv[6] = 6'h3f;
      expv[7] = 6'h3f;
      expv[8] = 6'h3f;
      expv[9] = 6'h3f;
      expv[10] = 6'h3f;
      expv[11] = 6'h3f;
      expv[12] = 6'h3f;
      expv[13] = 6'h3f;
      expv[14] = 6'h3f;
      expv[15] = 6'h3f;
      expv[16] = 6'h3f;
      expv[17] = 6'h3f;
      expv[18] = 6'h3f;
      expv[19] = 6'h3f;
      expv[20] = 6'h3f;
      expv[21] = 6'h3f;
      expv[22] = 6'h3f;
      expv[23] = 6'h3f;
      expv[24] = 6'h3f;
      expv[25] = 6'h3f;
      expv[26] = 6'h3f;
      expv[27] = 6'h3f;
      expv[28] = 6'h3f;
      expv[29] = 6'h3f;
      expv[30] = 6'h3f;
      expv[31] = 6'h3f;
      expv[32] = 6'h3f;
      expv[33] = 6'h3f;
      expv[34] = 6'h3f;
      expv[35] = 6'h3f;
      expv[36] = 6'h3f;
      expv[37] = 6'h3f;
      expv[38] = 6'h3f;
      expv[39] = 6'h3f;
      expv[40] = 6'h3f;
      expv[41] = 6'h3f;
      expv[42] = 6'h3f;
      expv[43] = 6'h3f;
      expv[44] = 6'h3f;
      expv[45] = 6'h3f;
      expv[46] = 6'h3f;
      expv[47] = 6'h3f;
      expv[48] = 6'h3f;
      expv[49] = 6'h3f;
      expv[50] = 6'h3f;
      expv[51] = 6'h3f;
      expv[52] = 6'h3f;
      expv[53] = 6'h3f;
      expv[54] = 6'h3f;
      expv[55] = 6'h3f;
      expv[56] = 6'h3f;
      expv[57] = 6'h3f;
      expv[58] = 6'h3f;
      expv[59] = 6'h3f;
      expv[60] = 6'h3f;
      expv[61] = 6'h3f;
      expv[62] = 6'h3f;
      expv[63] = 6'h3f;
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
