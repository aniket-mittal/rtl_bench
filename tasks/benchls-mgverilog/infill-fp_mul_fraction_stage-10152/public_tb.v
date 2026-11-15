// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 60;
  localparam OW = 29;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_10152 dut (
    .clk(clk),
    .rst(in_vec[59:59]),
    .fpu_op_i(in_vec[58:58]),
    .fracta_i(in_vec[57:30]),
    .fractb_i(in_vec[29:2]),
    .signa_i(in_vec[1:1]),
    .signb_i(in_vec[0:0]),
    .fract_o(out_vec[28:1]),
    .sign_o(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 60'he8e0cb376944f1f;
    stim[1] = 60'hf5236493c013be1;
    stim[2] = 60'h6cd2edbaf547435;
    stim[3] = 60'h56c711079f67df0;
    stim[4] = 60'h3cdbd15e610ae3a;
    stim[5] = 60'h1a0b6bd099af899;
    stim[6] = 60'h02be1ddd4663294;
    stim[7] = 60'h18e452799011b6a;
    stim[8] = 60'h33234ba897aa6e8;
    stim[9] = 60'h6ba8d13fe7635aa;
    stim[10] = 60'h343cadba04a54b1;
    stim[11] = 60'h64d42cb3678aa7c;
    stim[12] = 60'h6161c7b80d1f9ac;
    stim[13] = 60'h02981dc0e151f61;
    stim[14] = 60'h6b3b6ae03e2f44d;
    stim[15] = 60'h51787569e04e8d1;
    stim[16] = 60'h2e82cd7cd8d8a6d;
    stim[17] = 60'h0f24a51c97b29c6;
    stim[18] = 60'h3aa9d36bb4c8305;
    stim[19] = 60'h2aade9dbdd94491;
    stim[20] = 60'h4e30bac7e8399a4;
    stim[21] = 60'h1ed3c9121b76b5f;
    stim[22] = 60'h7ddea4e45f59b4f;
    stim[23] = 60'h0fdb0e7b0b65b1f;
    stim[24] = 60'h75de516db08a9d6;
    stim[25] = 60'h74d767896461f48;
    stim[26] = 60'h02346979e8eaade;
    stim[27] = 60'h48f41b73dd5beec;
    stim[28] = 60'h77599de436b758a;
    stim[29] = 60'h19ccd02d283e5c2;
    stim[30] = 60'h251b068591de5be;
    stim[31] = 60'h03e34bd7985e2fa;
    stim[32] = 60'h76df6163fbb08e4;
    stim[33] = 60'h06195c4bad5208b;
    stim[34] = 60'h5d75246fbbc0b9d;
    stim[35] = 60'h760ef108cf0689c;
    stim[36] = 60'h6a3dd608869f445;
    stim[37] = 60'h156a70a3321d9ed;
    stim[38] = 60'h116be4afa5b0932;
    stim[39] = 60'h4cd8ca6e3c04b2d;
    stim[40] = 60'h700d0cf5cd95221;
    stim[41] = 60'h4ab1729f5f371fc;
    stim[42] = 60'hafd39a7031b641f;
    stim[43] = 60'h603ef5e5954c29d;
    stim[44] = 60'h620700531f4984b;
    stim[45] = 60'h253fc4afa418f27;
    stim[46] = 60'h68a74538124bc16;
    stim[47] = 60'h479eefe97f1a944;
    stim[48] = 60'h084afdc04ba3b5a;
    stim[49] = 60'h602a20ca14fa89c;
    stim[50] = 60'h3f08afda5876b0c;
    stim[51] = 60'h6963ddbcb3f52fd;
    stim[52] = 60'h5e79cb249a21986;
    stim[53] = 60'h5095111d6792de0;
    stim[54] = 60'h26f6ad2ac574b10;
    stim[55] = 60'h2f33de24f171871;
    stim[56] = 60'h1bc31b44932cf54;
    stim[57] = 60'h2907e0332fdd110;
    stim[58] = 60'h5942354dacd7c7a;
    stim[59] = 60'h08babca1f79cbe5;
    stim[60] = 60'h0bcadb6cbe6506b;
    stim[61] = 60'h663171c0b2916d1;
    stim[62] = 60'h77559059568b6e1;
    stim[63] = 60'h72d35a6b33c144c;
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
      expv[0] = 29'h00000000;
      expv[1] = 29'h00000000;
      expv[2] = 29'h00000000;
      expv[3] = 29'h0e13b0f6;
      expv[4] = 29'h1197b677;
      expv[5] = 29'h0b659193;
      expv[6] = 29'h0838399c;
      expv[7] = 29'h0b922838;
      expv[8] = 29'h000e6478;
      expv[9] = 29'h1e4ef948;
      expv[10] = 29'h150f8373;
      expv[11] = 29'h09f92c84;
      expv[12] = 29'h08d23ee7;
      expv[13] = 29'h1047e706;
      expv[14] = 29'h05be80d1;
      expv[15] = 29'h178f2f96;
      expv[16] = 29'h17beaf1c;
      expv[17] = 29'h107aa188;
      expv[18] = 29'h02d4bdad;
      expv[19] = 29'h005157cf;
      expv[20] = 29'h0995ad5d;
      expv[21] = 29'h18296f71;
      expv[22] = 29'h00459a37;
      expv[23] = 29'h1bf484cd;
      expv[24] = 29'h0048b4cb;
      expv[25] = 29'h08737da1;
      expv[26] = 29'h0f48a420;
      expv[27] = 29'h0e2d20b2;
      expv[28] = 29'h1a70d1bf;
      expv[29] = 29'h1d6289b7;
      expv[30] = 29'h03a47537;
      expv[31] = 29'h05fe9065;
      expv[32] = 29'h1ad14b92;
      expv[33] = 29'h046dd3c3;
      expv[34] = 29'h00773e69;
      expv[35] = 29'h0c989804;
      expv[36] = 29'h148f4436;
      expv[37] = 29'h1953e526;
      expv[38] = 29'h0edbb4a7;
      expv[39] = 29'h14779242;
      expv[40] = 29'h184c8acc;
      expv[41] = 29'h06732f8a;
      expv[42] = 29'h00000000;
      expv[43] = 29'h00000000;
      expv[44] = 29'h1cc9dc40;
      expv[45] = 29'h07f6cbfc;
      expv[46] = 29'h0fc0a9e9;
      expv[47] = 29'h14e600a7;
      expv[48] = 29'h08295caf;
      expv[49] = 29'h01c86135;
      expv[50] = 29'h0092c3eb;
      expv[51] = 29'h12480d72;
      expv[52] = 29'h1a51985c;
      expv[53] = 29'h140df255;
      expv[54] = 29'h02f20e63;
      expv[55] = 29'h09a6fc1c;
      expv[56] = 29'h100e62da;
      expv[57] = 29'h127af54c;
      expv[58] = 29'h0e02d8a0;
      expv[59] = 29'h1a07d8e3;
      expv[60] = 29'h0b5f87a3;
      expv[61] = 29'h0bd895eb;
      expv[62] = 29'h18ad4448;
      expv[63] = 29'h065f239c;
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
