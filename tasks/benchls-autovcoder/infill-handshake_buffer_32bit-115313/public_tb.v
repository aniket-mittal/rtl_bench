// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 35;
  localparam OW = 35;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_115313 dut (
    .ap_clk(clk),
    .ap_rst(in_vec[34:34]),
    .data_in(in_vec[33:2]),
    .vld_in(in_vec[1:1]),
    .ack_out(in_vec[0:0]),
    .ack_in(out_vec[34:34]),
    .data_out(out_vec[33:2]),
    .vld_out(out_vec[1:1]),
    .apdone_blk(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 35'h766aa99b8;
    stim[1] = 35'h49abd5b3d;
    stim[2] = 35'h23eb423c9;
    stim[3] = 35'h2beaadd03;
    stim[4] = 35'h3490ffcc6;
    stim[5] = 35'h00e133da9;
    stim[6] = 35'h187ffab15;
    stim[7] = 35'h3001fe5cd;
    stim[8] = 35'h1cb8e066a;
    stim[9] = 35'h2ea1e0a0f;
    stim[10] = 35'h111073122;
    stim[11] = 35'h2caafc015;
    stim[12] = 35'h358536678;
    stim[13] = 35'h3068d6fb5;
    stim[14] = 35'h2188fa44e;
    stim[15] = 35'h164fcbce1;
    stim[16] = 35'h154efcfca;
    stim[17] = 35'h1a06b8a5d;
    stim[18] = 35'h3298b27f3;
    stim[19] = 35'h31fdda12d;
    stim[20] = 35'h09d9eae93;
    stim[21] = 35'h0709e3c4c;
    stim[22] = 35'h20d29f7c2;
    stim[23] = 35'h30b10770e;
    stim[24] = 35'h23d35b327;
    stim[25] = 35'h18d1bdf56;
    stim[26] = 35'h175726a8f;
    stim[27] = 35'h1b3f89889;
    stim[28] = 35'h1c5ddbad7;
    stim[29] = 35'h1e8a4c988;
    stim[30] = 35'h1411dafac;
    stim[31] = 35'h178d8097b;
    stim[32] = 35'h2d88b0850;
    stim[33] = 35'h3a6ec43ec;
    stim[34] = 35'h2a6a9d40d;
    stim[35] = 35'h3f4853802;
    stim[36] = 35'h3d8c00011;
    stim[37] = 35'h2f64738e9;
    stim[38] = 35'h1374492dd;
    stim[39] = 35'h169a66941;
    stim[40] = 35'h23192651d;
    stim[41] = 35'h2d8c004f4;
    stim[42] = 35'h2428fb3fd;
    stim[43] = 35'h214222f4c;
    stim[44] = 35'h2c216b183;
    stim[45] = 35'h3d87e08b9;
    stim[46] = 35'h20b8570d2;
    stim[47] = 35'h18dfbc54b;
    stim[48] = 35'h0a3c0c705;
    stim[49] = 35'h2d333462a;
    stim[50] = 35'h37b2b9b9a;
    stim[51] = 35'h15df2e80f;
    stim[52] = 35'h097b68bd4;
    stim[53] = 35'h153de2c07;
    stim[54] = 35'h2963abaae;
    stim[55] = 35'h073d4f687;
    stim[56] = 35'h3b46f6be2;
    stim[57] = 35'h0ebdae1c0;
    stim[58] = 35'h0f54080ca;
    stim[59] = 35'h38ebf00da;
    stim[60] = 35'h281705470;
    stim[61] = 35'h252b28cfc;
    stim[62] = 35'h28b1f6752;
    stim[63] = 35'h26dd7e14f;
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
      expv[0] = 35'hxxxxxxxxx;
      expv[1] = 35'hxxxxxxxxx;
      expv[2] = 35'h09abd5b3c;
      expv[3] = 35'h63eb423c8;
      expv[4] = 35'h6beaadd03;
      expv[5] = 35'h2beaadd03;
      expv[6] = 35'h7490ffcc6;
      expv[7] = 35'h587ffab14;
      expv[8] = 35'h7001fe5cc;
      expv[9] = 35'h5cb8e066a;
      expv[10] = 35'h6ea1e0a0f;
      expv[11] = 35'h2ea1e0a0f;
      expv[12] = 35'h511073123;
      expv[13] = 35'h511073122;
      expv[14] = 35'h7068d6fb4;
      expv[15] = 35'h6188fa44e;
      expv[16] = 35'h564fcbce0;
      expv[17] = 35'h554efcfca;
      expv[18] = 35'h5a06b8a5c;
      expv[19] = 35'h7298b27f2;
      expv[20] = 35'h71fdda12c;
      expv[21] = 35'h49d9eae93;
      expv[22] = 35'h49d9eae93;
      expv[23] = 35'h09d9eae93;
      expv[24] = 35'h09d9eae93;
      expv[25] = 35'h60d29f7c3;
      expv[26] = 35'h20d29f7c3;
      expv[27] = 35'h58d1bdf56;
      expv[28] = 35'h5b3f89888;
      expv[29] = 35'h5c5ddbad7;
      expv[30] = 35'h5c5ddbad7;
      expv[31] = 35'h5c5ddbad6;
      expv[32] = 35'h578d8097b;
      expv[33] = 35'h578d8097b;
      expv[34] = 35'h578d8097a;
      expv[35] = 35'h6a6a9d40c;
      expv[36] = 35'h7f4853802;
      expv[37] = 35'h7d8c00010;
      expv[38] = 35'h6f64738e8;
      expv[39] = 35'h5374492dc;
      expv[40] = 35'h569a66940;
      expv[41] = 35'h63192651c;
      expv[42] = 35'h6d8c004f4;
      expv[43] = 35'h6428fb3fc;
      expv[44] = 35'h614222f4c;
      expv[45] = 35'h6c216b182;
      expv[46] = 35'h7d87e08b8;
      expv[47] = 35'h60b8570d2;
      expv[48] = 35'h58dfbc54a;
      expv[49] = 35'h4a3c0c704;
      expv[50] = 35'h6d333462b;
      expv[51] = 35'h2d333462b;
      expv[52] = 35'h77b2b9b9b;
      expv[53] = 35'h77b2b9b9a;
      expv[54] = 35'h553de2c07;
      expv[55] = 35'h153de2c07;
      expv[56] = 35'h6963abaaf;
      expv[57] = 35'h2963abaaf;
      expv[58] = 35'h2963abaaf;
      expv[59] = 35'h2963abaaf;
      expv[60] = 35'h2963abaaf;
      expv[61] = 35'h2963abaaf;
      expv[62] = 35'h2963abaaf;
      expv[63] = 35'h2963abaaf;
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
