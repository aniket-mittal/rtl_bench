// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 35;
  localparam OW = 130;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_011764 dut (
    .clk(clk),
    .rst_n(in_vec[34:34]),
    .up_dat(in_vec[33:18]),
    .up_vld(in_vec[17:17]),
    .length(in_vec[16:1]),
    .dn_rdy(in_vec[0:0]),
    .up_rdy(out_vec[129:129]),
    .dn_dat(out_vec[128:1]),
    .dn_vld(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 35'h3afe5d02d;
    stim[1] = 35'h3277b9fb2;
    stim[2] = 35'h44910d443;
    stim[3] = 35'h66f5c5412;
    stim[4] = 35'h5e037935c;
    stim[5] = 35'h707c284e4;
    stim[6] = 35'h7d8441ef2;
    stim[7] = 35'h7e32ddfc7;
    stim[8] = 35'h4bd96b6b2;
    stim[9] = 35'h7b715b480;
    stim[10] = 35'h6fac55ab2;
    stim[11] = 35'h607897c60;
    stim[12] = 35'h4cbf51397;
    stim[13] = 35'h766bee367;
    stim[14] = 35'h55db22704;
    stim[15] = 35'h649c375f6;
    stim[16] = 35'h673785def;
    stim[17] = 35'h4d46b7dff;
    stim[18] = 35'h5408663a6;
    stim[19] = 35'h7b78e9425;
    stim[20] = 35'h45bb2cfef;
    stim[21] = 35'h4b5433304;
    stim[22] = 35'h43d8abe5d;
    stim[23] = 35'h7b7acb95a;
    stim[24] = 35'h50beefb96;
    stim[25] = 35'h7dd87339d;
    stim[26] = 35'h4f366af61;
    stim[27] = 35'h7c88a32d5;
    stim[28] = 35'h74a5ccb31;
    stim[29] = 35'h595838cfb;
    stim[30] = 35'h6942d1107;
    stim[31] = 35'h67dbe929d;
    stim[32] = 35'h4e13c15d8;
    stim[33] = 35'h65a41ce80;
    stim[34] = 35'h680ecbd67;
    stim[35] = 35'h506c7e391;
    stim[36] = 35'h50879abcf;
    stim[37] = 35'h79d03b371;
    stim[38] = 35'h66023f6a0;
    stim[39] = 35'h742f9ca6b;
    stim[40] = 35'h79f8c2352;
    stim[41] = 35'h7498271d6;
    stim[42] = 35'h756b56b31;
    stim[43] = 35'h6cc373135;
    stim[44] = 35'h592281a3e;
    stim[45] = 35'h73a406f43;
    stim[46] = 35'h4a68aeae1;
    stim[47] = 35'h48d2d9502;
    stim[48] = 35'h6cb4baba4;
    stim[49] = 35'h4c0208a36;
    stim[50] = 35'h50619c04e;
    stim[51] = 35'h6b72510ae;
    stim[52] = 35'h5a0a9df31;
    stim[53] = 35'h4a62d8112;
    stim[54] = 35'h5ae6a5d97;
    stim[55] = 35'h616639024;
    stim[56] = 35'h471389f2c;
    stim[57] = 35'h7049bc87f;
    stim[58] = 35'h74148f3d1;
    stim[59] = 35'h6989d875a;
    stim[60] = 35'h4ef04f755;
    stim[61] = 35'h7ae23d927;
    stim[62] = 35'h43df440d4;
    stim[63] = 35'h4649553c2;
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
      expv[0] = 130'h200000000000000000000000000000000;
      expv[1] = 130'h000000000000000000000000000000000;
      expv[2] = 130'h200000000000000000000000000000000;
      expv[3] = 130'h000000000000000000000000000000000;
      expv[4] = 130'h000000000000000000000000000000000;
      expv[5] = 130'h000000000000000000000000000000000;
      expv[6] = 130'h000000000000000000000000000000000;
      expv[7] = 130'h20000000000000000000000000000f01a;
      expv[8] = 130'h000000000000000000000000183e0f01a;
      expv[9] = 130'h000000000000000000000000183e0f01a;
      expv[10] = 130'h000000000000000000000000183e0f01a;
      expv[11] = 130'h0000000000000000000005ecb83e0f01a;
      expv[12] = 130'h2000000000000000000005ecb83e0f01a;
      expv[13] = 130'h2000000000000000000005ecb83e0f01a;
      expv[14] = 130'h0000000000000000000005ecb83e0f01a;
      expv[15] = 130'h0000000000000000000005ecb83e0f01a;
      expv[16] = 130'h20000000000000001b35e5ecb83e0f01a;
      expv[17] = 130'h2000000000000aed9b35e5ecb83e0f01a;
      expv[18] = 130'h00000000124e0aed9b35e5ecb83e0f01a;
      expv[19] = 130'h20000000124e0aed9b35e5ecb83e0f01a;
      expv[20] = 130'h200006a3524e0aed9b35e5ecb83e0f01a;
      expv[21] = 130'h0a0426a3524e0aed9b35e5ecb83e0f01b;
      expv[22] = 130'h2a0426a3524e0aed9b35e5ecbdbc6f01a;
      expv[23] = 130'h0a0426a3524e0aed9b35e2dd9dbc6f01a;
      expv[24] = 130'h0a0426a3524e0aed85aa02dd9dbc6f01a;
      expv[25] = 130'h2a0426a3524e01ec45aa02dd9dbc6f01a;
      expv[26] = 130'h2a0426a3524e01ec45aa02dd9dbc6f01a;
      expv[27] = 130'h2a0426a3485f61ec45aa02dd9dbc6f01a;
      expv[28] = 130'h2a043eec285f61ec45aa02dd9dbc6f01a;
      expv[29] = 130'h279b3eec285f61ec45aa02dd9dbc6f01a;
      expv[30] = 130'h279b3eec285f61ec45aa02dd9dbc7e445;
      expv[31] = 130'h279b3eec285f61ec45aa02dd9dbc7e444;
      expv[32] = 130'h079b3eec285f61ec45aa02dd8cac1e444;
      expv[33] = 130'h079b3eec285f61ec45aa02dd8cac1e444;
      expv[34] = 130'h279b3eec285f61ec45aa13edecac1e444;
      expv[35] = 130'h279b3eec285f61ec45aa13edecac1e444;
      expv[36] = 130'h279b3eec285f61ec45aa13edecac1e444;
      expv[37] = 130'h279b3eec285f61ec45aa13edecac1e444;
      expv[38] = 130'h079b3eec285f61ec483633edecac1e444;
      expv[39] = 130'h279b3eec285f61ec483633edecac1e444;
      expv[40] = 130'h079b3eec285f7ce8083633edecac1e444;
      expv[41] = 130'h079b3eec33011ce8083633edecac1e444;
      expv[42] = 130'h279b3eec33011ce8083633edecac1e444;
      expv[43] = 130'h279b3eec33011ce8083633edecac1e444;
      expv[44] = 130'h079b3a4c13011ce8083633edecac1e444;
      expv[45] = 130'h279b3a4c13011ce8083633edecac1e444;
      expv[46] = 130'h3661ba4c13011ce8083633edecac1e444;
      expv[47] = 130'h1661ba4c13011ce8083633edecac1e445;
      expv[48] = 130'h1661ba4c13011ce8083633edecac1e445;
      expv[49] = 130'h1661ba4c13011ce8083633edecac05345;
      expv[50] = 130'h1661ba4c13011ce8083633edecac05344;
      expv[51] = 130'h1661ba4c13011ce80836365a4cac05344;
      expv[52] = 130'h3661ba4c13011ce80836365a4cac05344;
      expv[53] = 130'h1661ba4c13011ce80836365a4cac05344;
      expv[54] = 130'h3661ba4c13011ce80836365a4cac05344;
      expv[55] = 130'h1661ba4c13011ce80836365a4cac05344;
      expv[56] = 130'h1661ba4c13011ce80836365a4cac05344;
      expv[57] = 130'h3661ba4c13011ce80d73565a4cac05344;
      expv[58] = 130'h3661ba4c130110b30d73565a4cac05344;
      expv[59] = 130'h1661ba4c130110b30d73565a4cac05344;
      expv[60] = 130'h3661ba4c1824d0b30d73565a4cac05344;
      expv[61] = 130'h3661ba4c1824d0b30d73565a4cac05344;
      expv[62] = 130'h1661ba4c1824d0b30d73565a4cac05344;
      expv[63] = 130'h1661ba4c1824d0b30d73565a4cac05344;
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
