// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 65;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_106997 dut (
    .clk(clk),
    .enable(in_vec[64:64]),
    .lhs(in_vec[63:32]),
    .rhs(in_vec[31:0]),
    .ret(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 65'h00184d4e3ef3c2093;
    stim[1] = 65'h193279933268d79de;
    stim[2] = 65'h02f828cbda544c952;
    stim[3] = 65'h1b6af508e4a12da5d;
    stim[4] = 65'h1aa55305fa75a1a38;
    stim[5] = 65'h17a6fc8db6c1f1cda;
    stim[6] = 65'h08c458a91813833e2;
    stim[7] = 65'h197d19daa813c7a8f;
    stim[8] = 65'h04f00ee31e75400aa;
    stim[9] = 65'h0001dd2a724c90320;
    stim[10] = 65'h0dddb51aea016b487;
    stim[11] = 65'h0c41cdb67d127ef21;
    stim[12] = 65'h04c1b25a781429cfb;
    stim[13] = 65'h0456ce836070dee45;
    stim[14] = 65'h17d61bfa90465805e;
    stim[15] = 65'h01e6cdf261db66b89;
    stim[16] = 65'h186b6fcdfa789cb3a;
    stim[17] = 65'h06052b93c6c39a50d;
    stim[18] = 65'h1f1e1ad4a0a3b2932;
    stim[19] = 65'h06a3077c561c553b3;
    stim[20] = 65'h0c23f2aab324c4706;
    stim[21] = 65'h02440ddd7a542bd84;
    stim[22] = 65'h08c14944af664623d;
    stim[23] = 65'h1a53e123cf85f1df8;
    stim[24] = 65'h00671e334a41a40aa;
    stim[25] = 65'h1bf3baf83eaa88eaf;
    stim[26] = 65'h0ec1c94360686bfa0;
    stim[27] = 65'h118b25877ae2d156e;
    stim[28] = 65'h1e5603eadc615a174;
    stim[29] = 65'h0646f235557047456;
    stim[30] = 65'h095d084befed8e19a;
    stim[31] = 65'h1e925d708ece8377f;
    stim[32] = 65'h102061c60c514f9e7;
    stim[33] = 65'h0e3d75d466a5b0a7e;
    stim[34] = 65'h0051ae00340cbe3fb;
    stim[35] = 65'h01a543ec3af043a7f;
    stim[36] = 65'h15e1bb8f4a87ada99;
    stim[37] = 65'h1e8a21ad8c3690987;
    stim[38] = 65'h1ae92e7b93bb2a8f6;
    stim[39] = 65'h11a8079169341c0e9;
    stim[40] = 65'h08577eb761c49c622;
    stim[41] = 65'h1e6fd00c89c8c15f4;
    stim[42] = 65'h1070e51f588e76040;
    stim[43] = 65'h1244266074d97c1b4;
    stim[44] = 65'h012ecab898fd74272;
    stim[45] = 65'h0262d4bc6a6aee075;
    stim[46] = 65'h08531dcd6dd12155b;
    stim[47] = 65'h0d3b36178ab1bcc25;
    stim[48] = 65'h0fd9591baf481bf6f;
    stim[49] = 65'h07000697a1231ceed;
    stim[50] = 65'h1ba588a6cf02ba7b9;
    stim[51] = 65'h007a4f3fefb5836ef;
    stim[52] = 65'h1c5884601a45df124;
    stim[53] = 65'h01eaa058ac6d92c86;
    stim[54] = 65'h11312a1b1386eba94;
    stim[55] = 65'h02874fdd11ba33895;
    stim[56] = 65'h0593ddd0c7145eb54;
    stim[57] = 65'h032bac640d0bf0d36;
    stim[58] = 65'h1aad18b5b04cb30af;
    stim[59] = 65'h09e1ad6532ca8e94a;
    stim[60] = 65'h15b3feade6f6a8e27;
    stim[61] = 65'h1a6555c63a455469c;
    stim[62] = 65'h0129a436b3408b184;
    stim[63] = 65'h1c1272aa34335bd1b;
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
      expv[0] = 1'h0;
      expv[1] = 1'h0;
      expv[2] = 1'h0;
      expv[3] = 1'h0;
      expv[4] = 1'h0;
      expv[5] = 1'h0;
      expv[6] = 1'h0;
      expv[7] = 1'h0;
      expv[8] = 1'h0;
      expv[9] = 1'h0;
      expv[10] = 1'h0;
      expv[11] = 1'h0;
      expv[12] = 1'h0;
      expv[13] = 1'h0;
      expv[14] = 1'h0;
      expv[15] = 1'h0;
      expv[16] = 1'h0;
      expv[17] = 1'h0;
      expv[18] = 1'h0;
      expv[19] = 1'h0;
      expv[20] = 1'h0;
      expv[21] = 1'h0;
      expv[22] = 1'h0;
      expv[23] = 1'h0;
      expv[24] = 1'h0;
      expv[25] = 1'h0;
      expv[26] = 1'h0;
      expv[27] = 1'h0;
      expv[28] = 1'h0;
      expv[29] = 1'h0;
      expv[30] = 1'h0;
      expv[31] = 1'h0;
      expv[32] = 1'h0;
      expv[33] = 1'h0;
      expv[34] = 1'h0;
      expv[35] = 1'h0;
      expv[36] = 1'h0;
      expv[37] = 1'h0;
      expv[38] = 1'h0;
      expv[39] = 1'h0;
      expv[40] = 1'h0;
      expv[41] = 1'h0;
      expv[42] = 1'h0;
      expv[43] = 1'h0;
      expv[44] = 1'h0;
      expv[45] = 1'h0;
      expv[46] = 1'h0;
      expv[47] = 1'h0;
      expv[48] = 1'h0;
      expv[49] = 1'h0;
      expv[50] = 1'h0;
      expv[51] = 1'h0;
      expv[52] = 1'h0;
      expv[53] = 1'h0;
      expv[54] = 1'h0;
      expv[55] = 1'h0;
      expv[56] = 1'h0;
      expv[57] = 1'h0;
      expv[58] = 1'h0;
      expv[59] = 1'h0;
      expv[60] = 1'h0;
      expv[61] = 1'h0;
      expv[62] = 1'h0;
      expv[63] = 1'h0;
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
