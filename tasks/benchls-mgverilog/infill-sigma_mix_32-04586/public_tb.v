// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_04586 dut (
    .x(in_vec[31:0]),
    .y(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'hf30e0d8e;
    stim[1] = 32'hf7121214;
    stim[2] = 32'h3aa7494f;
    stim[3] = 32'h028eb698;
    stim[4] = 32'h60c23585;
    stim[5] = 32'h8cb3a705;
    stim[6] = 32'hf5964c79;
    stim[7] = 32'hc8f6d203;
    stim[8] = 32'hb5d1daca;
    stim[9] = 32'h550dbb7a;
    stim[10] = 32'h797d2e39;
    stim[11] = 32'hcb8487ba;
    stim[12] = 32'h138eefc8;
    stim[13] = 32'hc89f791f;
    stim[14] = 32'h956498a7;
    stim[15] = 32'hc4d76652;
    stim[16] = 32'h3235c69b;
    stim[17] = 32'hb6cc4741;
    stim[18] = 32'hef2108dd;
    stim[19] = 32'h242c356a;
    stim[20] = 32'hdc0961c8;
    stim[21] = 32'h84f0422b;
    stim[22] = 32'h955b40fe;
    stim[23] = 32'hee5a5b14;
    stim[24] = 32'h4cdef5f9;
    stim[25] = 32'h8cd725e7;
    stim[26] = 32'h169ae6f7;
    stim[27] = 32'h213c8cac;
    stim[28] = 32'hd2c37a7c;
    stim[29] = 32'h978e2ede;
    stim[30] = 32'h8fff4101;
    stim[31] = 32'h902b4d1f;
    stim[32] = 32'haccd9443;
    stim[33] = 32'hbaad4fec;
    stim[34] = 32'h7aeebd72;
    stim[35] = 32'h490344ac;
    stim[36] = 32'h893efdaa;
    stim[37] = 32'hd964bf07;
    stim[38] = 32'h7e561f26;
    stim[39] = 32'h71d0992e;
    stim[40] = 32'hf51f948f;
    stim[41] = 32'ha64f64c5;
    stim[42] = 32'h13df4865;
    stim[43] = 32'h05beba59;
    stim[44] = 32'hc8e005f8;
    stim[45] = 32'h20a10853;
    stim[46] = 32'he1228ca7;
    stim[47] = 32'h6d2fbf3c;
    stim[48] = 32'h59392309;
    stim[49] = 32'h408dacc4;
    stim[50] = 32'ha09027ad;
    stim[51] = 32'h60bfdc49;
    stim[52] = 32'hc14c3e34;
    stim[53] = 32'hf2f0301a;
    stim[54] = 32'haed38060;
    stim[55] = 32'h25f0d08f;
    stim[56] = 32'h2c725116;
    stim[57] = 32'h6d61693c;
    stim[58] = 32'h40edb300;
    stim[59] = 32'h3a8d78bc;
    stim[60] = 32'hd4d857ff;
    stim[61] = 32'hfec60268;
    stim[62] = 32'h1ca46027;
    stim[63] = 32'h5c5ab827;
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
      expv[0] = 32'h80e46169;
      expv[1] = 32'hb3895ba2;
      expv[2] = 32'h4b726912;
      expv[3] = 32'h9df2cb1d;
      expv[4] = 32'h8bb89aeb;
      expv[5] = 32'hf34e7082;
      expv[6] = 32'h7e479872;
      expv[7] = 32'haa0fc5d9;
      expv[8] = 32'hf5633598;
      expv[9] = 32'h90d5395a;
      expv[10] = 32'h365301c4;
      expv[11] = 32'h4d092b19;
      expv[12] = 32'h29a4c4c5;
      expv[13] = 32'hf8c523f6;
      expv[14] = 32'h7bafbf7c;
      expv[15] = 32'h6487f333;
      expv[16] = 32'h41841fd3;
      expv[17] = 32'h84647dd5;
      expv[18] = 32'he40d18c2;
      expv[19] = 32'hdd9757cc;
      expv[20] = 32'hd24b09f8;
      expv[21] = 32'h571d09fd;
      expv[22] = 32'h3fbe7bc8;
      expv[23] = 32'ha2d2c442;
      expv[24] = 32'h467c3063;
      expv[25] = 32'h17faa9c2;
      expv[26] = 32'h5543acb5;
      expv[27] = 32'h7f4ee0c3;
      expv[28] = 32'h3d62dd0b;
      expv[29] = 32'h24697c65;
      expv[30] = 32'hc2a0755d;
      expv[31] = 32'hfe62db33;
      expv[32] = 32'hf7d0c293;
      expv[33] = 32'h9ddbddc9;
      expv[34] = 32'h44f4946f;
      expv[35] = 32'h80997c5c;
      expv[36] = 32'hfb5f0001;
      expv[37] = 32'h3b5fa8c7;
      expv[38] = 32'hc4fff04f;
      expv[39] = 32'h74922e63;
      expv[40] = 32'he46a30ff;
      expv[41] = 32'h46b41bc2;
      expv[42] = 32'h1a45136b;
      expv[43] = 32'h1c2aeb50;
      expv[44] = 32'he9f3f28c;
      expv[45] = 32'he041ab32;
      expv[46] = 32'hf0cfecc5;
      expv[47] = 32'h9ab0b3d2;
      expv[48] = 32'h51570069;
      expv[49] = 32'heba1bee2;
      expv[50] = 32'h46b84c9e;
      expv[51] = 32'h69c4dc1e;
      expv[52] = 32'h7e262fe9;
      expv[53] = 32'h27bd5adf;
      expv[54] = 32'h349ffcb8;
      expv[55] = 32'h2ed632cc;
      expv[56] = 32'hbd93259c;
      expv[57] = 32'h2f39f4ad;
      expv[58] = 32'h645c7d3d;
      expv[59] = 32'h210bbb45;
      expv[60] = 32'hf0cd4f66;
      expv[61] = 32'h4ebf73f8;
      expv[62] = 32'h55a403ed;
      expv[63] = 32'heb3a3562;
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
