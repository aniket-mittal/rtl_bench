// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 70;
  localparam OW = 36;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_02903 dut (
    .clk(clk),
    .rst(in_vec[69:69]),
    .pc(in_vec[68:37]),
    .update_btb_tag(in_vec[36:36]),
    .update_btb_target(in_vec[35:35]),
    .btb_target_in(in_vec[34:3]),
    .btb_type_in(in_vec[2:1]),
    .PHT_pred_taken(in_vec[0:0]),
    .btb_type_out(out_vec[35:34]),
    .btb_target_out(out_vec[33:2]),
    .btb_v(out_vec[1:1]),
    .en_btb_pred(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 70'h3bdae66d3fd6d35f73;
    stim[1] = 70'h3c237c12ad3a5aa2cb;
    stim[2] = 70'h1e88548f90b2755e93;
    stim[3] = 70'h113ac2fb71044c592f;
    stim[4] = 70'h0806a280c6b99d62b6;
    stim[5] = 70'h172ecb87e92097379c;
    stim[6] = 70'h1be88ccfc8bb265d2c;
    stim[7] = 70'h1149c9543e7575fbca;
    stim[8] = 70'h180643c84273955dff;
    stim[9] = 70'h1023fe3da2ef12530b;
    stim[10] = 70'h116e0877ea80ce3d91;
    stim[11] = 70'h08c121357894c89e12;
    stim[12] = 70'h1e808cde612272f385;
    stim[13] = 70'h085662e076b90ffb94;
    stim[14] = 70'h19e2ab7be109b806c5;
    stim[15] = 70'h0a067885b3c299283f;
    stim[16] = 70'h02ba41e7892580f1a4;
    stim[17] = 70'h0adf30a79fa578659c;
    stim[18] = 70'h0718a8f0ce80e926f1;
    stim[19] = 70'h1240060b92312d3ad8;
    stim[20] = 70'h06813928830247410b;
    stim[21] = 70'h06e27c0ea20e3c008a;
    stim[22] = 70'h0cb845f152f14adf1d;
    stim[23] = 70'h07ecafeedd64c75c74;
    stim[24] = 70'h1eea4998feb06127f0;
    stim[25] = 70'h16cc2d83b383e3877a;
    stim[26] = 70'h1a68458cbe8215c6fa;
    stim[27] = 70'h1270d3dd1bce511cc4;
    stim[28] = 70'h091f52ec3e73079adf;
    stim[29] = 70'h156eefc82dbe125c3a;
    stim[30] = 70'h0da5da3a11f40c832b;
    stim[31] = 70'h0d8f07d448e661b7f5;
    stim[32] = 70'h0085761bee48137cf7;
    stim[33] = 70'h02cad8e788cff85b22;
    stim[34] = 70'h07a4dc40674bad2e2a;
    stim[35] = 70'h15f5b84b7aa852acb8;
    stim[36] = 70'h1f7fddebc4c218feb1;
    stim[37] = 70'h0fa5326ae533391aa5;
    stim[38] = 70'h18ed2833eeb586de3a;
    stim[39] = 70'h03cb70e4cdf8f77a8b;
    stim[40] = 70'h10c64b4c350143dab9;
    stim[41] = 70'h081e1a2d0b732e7bc9;
    stim[42] = 70'h11e46bcdcfc948c493;
    stim[43] = 70'h079030e405f91a17ff;
    stim[44] = 70'h010c8c7df46e15d852;
    stim[45] = 70'h1eb80dacef3a39357f;
    stim[46] = 70'h0126df9ea8a078da2f;
    stim[47] = 70'h14546a4287b5697a37;
    stim[48] = 70'h1943634e65353b5e27;
    stim[49] = 70'h12bbc95bc6e9295131;
    stim[50] = 70'h000ec4cd5b709ed312;
    stim[51] = 70'h073bcb403b1c150516;
    stim[52] = 70'h193234d5b19663086c;
    stim[53] = 70'h15675d49ccea118cb2;
    stim[54] = 70'h0e7184aade7d2629bc;
    stim[55] = 70'h018078d39ad94febf3;
    stim[56] = 70'h171efbbd8c178b786e;
    stim[57] = 70'h06cd877680dab2fb34;
    stim[58] = 70'h10e385532f8fdee749;
    stim[59] = 70'h0732000e70601caa65;
    stim[60] = 70'h172793734e6051c009;
    stim[61] = 70'h0c067c9345097f6005;
    stim[62] = 70'h15a99d566914a4e0c5;
    stim[63] = 70'h1e52b5e86e6904ef40;
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
      expv[0] = 36'hxxxxxxxxx;
      expv[1] = 36'hxxxxxxxxx;
      expv[2] = 36'hxxxxxxxxx;
      expv[3] = 36'hxxxxxxxxx;
      expv[4] = 36'hxxxxxxxxx;
      expv[5] = 36'hxxxxxxxxx;
      expv[6] = 36'hxxxxxxxx0;
      expv[7] = 36'hxxxxxxxxx;
      expv[8] = 36'hxxxxxxxxx;
      expv[9] = 36'hxxxxxxxxx;
      expv[10] = 36'hxxxxxxxxx;
      expv[11] = 36'hxxxxxxxxx;
      expv[12] = 36'hxxxxxxxxx;
      expv[13] = 36'hxxxxxxxxx;
      expv[14] = 36'hxxxxxxxxx;
      expv[15] = 36'hxxxxxxxxx;
      expv[16] = 36'h8904b9bcx;
      expv[17] = 36'h892c078dx;
      expv[18] = 36'hxxxxxxxxx;
      expv[19] = 36'hxxxxxxxxx;
      expv[20] = 36'hxxxxxxxxx;
      expv[21] = 36'hxxxxxxxxx;
      expv[22] = 36'hxxxxxxxxx;
      expv[23] = 36'hxxxxxxxxx;
      expv[24] = 36'hxxxxxxxxx;
      expv[25] = 36'hxxxxxxxxx;
      expv[26] = 36'hxxxxxxxxx;
      expv[27] = 36'hxxxxxxxxx;
      expv[28] = 36'hxxxxxxxxx;
      expv[29] = 36'hxxxxxxxxx;
      expv[30] = 36'hxxxxxxxxx;
      expv[31] = 36'h73abafde0;
      expv[32] = 36'hxxxxxxxxx;
      expv[33] = 36'hbd2bc32c0;
      expv[34] = 36'hxxxxxxxx0;
      expv[35] = 36'hxxxxxxxxx;
      expv[36] = 36'hxxxxxxxx0;
      expv[37] = 36'hxxxxxxxxx;
      expv[38] = 36'hxxxxxxxxx;
      expv[39] = 36'hxxxxxxxxx;
      expv[40] = 36'hf3983cd60;
      expv[41] = 36'h7eb69afb0;
      expv[42] = 36'hxxxxxxxxx;
      expv[43] = 36'hxxxxxxxxx;
      expv[44] = 36'hxxxxxxxxx;
      expv[45] = 36'h7410ae370;
      expv[46] = 36'hxxxxxxxxx;
      expv[47] = 36'hxxxxxxxxx;
      expv[48] = 36'hxxxxxxxxx;
      expv[49] = 36'hf2409be7x;
      expv[50] = 36'h1b9973de0;
      expv[51] = 36'hxxxxxxxx0;
      expv[52] = 36'hxxxxxxxxx;
      expv[53] = 36'hxxxxxxxxx;
      expv[54] = 36'hxxxxxxxxx;
      expv[55] = 36'h75ac36f1x;
      expv[56] = 36'hxxxxxxxx0;
      expv[57] = 36'hxxxxxxxxx;
      expv[58] = 36'hxxxxxxxxx;
      expv[59] = 36'hxxxxxxxxx;
      expv[60] = 36'h3c7ef73ax;
      expv[61] = 36'h33028e00x;
      expv[62] = 36'hxxxxxxxxx;
      expv[63] = 36'h6df092e1x;
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
