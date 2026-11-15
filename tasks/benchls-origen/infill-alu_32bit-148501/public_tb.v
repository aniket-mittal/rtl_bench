// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 67;
  localparam OW = 34;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_148501 dut (
    .clk(clk),
    .data1(in_vec[66:35]),
    .data2(in_vec[34:3]),
    .ctrl(in_vec[2:0]),
    .oCarry(out_vec[33:33]),
    .oZero(out_vec[32:32]),
    .out(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 67'h47a2a0be84e43f2df;
    stim[1] = 67'h0977ab7853e991f31;
    stim[2] = 67'h75280e87efab7b0b2;
    stim[3] = 67'h4fc2d17e99b086f67;
    stim[4] = 67'h5db963ee2b6e41ba3;
    stim[5] = 67'h683b2397531caaa3a;
    stim[6] = 67'h0be1f40d2d498d996;
    stim[7] = 67'h0727f092561ca921f;
    stim[8] = 67'h6443b40918c91a53d;
    stim[9] = 67'h29f9b603df0832017;
    stim[10] = 67'h4c607d884fb5f7e89;
    stim[11] = 67'h5666eee6a9d70842e;
    stim[12] = 67'h1c2fc3fcd6ea018a0;
    stim[13] = 67'h376ffcea52ca62aa8;
    stim[14] = 67'h6c0d89b3a77861b54;
    stim[15] = 67'h3076dc51862137abe;
    stim[16] = 67'h02ebbcfa3bceb1a9c;
    stim[17] = 67'h1f660bc40c25050c9;
    stim[18] = 67'h10aff91c0a4d25ea8;
    stim[19] = 67'h237aa6cbdabbb16a6;
    stim[20] = 67'h16bab4b350a5f984c;
    stim[21] = 67'h2a69ff3000c838369;
    stim[22] = 67'h7bc0c5910f8eb746a;
    stim[23] = 67'h625f729f2c015376e;
    stim[24] = 67'h24f1778377c628a70;
    stim[25] = 67'h4f2237eb0954c2923;
    stim[26] = 67'h3f3953d896d443f8c;
    stim[27] = 67'h3cf695ab4dec76830;
    stim[28] = 67'h75957e945b9ff8e4f;
    stim[29] = 67'h26bc028d8c37527d7;
    stim[30] = 67'h6874716ab2b23ad67;
    stim[31] = 67'h5fd31b9d2a51af658;
    stim[32] = 67'h04f879d52581f7f4c;
    stim[33] = 67'h6241381fc8dc5d9d4;
    stim[34] = 67'h064c645a257de393b;
    stim[35] = 67'h396b68a1c306b4908;
    stim[36] = 67'h47eb44f5dd9487add;
    stim[37] = 67'h0b5a13e6a23358486;
    stim[38] = 67'h3579a20dc4433cca0;
    stim[39] = 67'h462b94727755cd47a;
    stim[40] = 67'h14d56e5a8a19407dc;
    stim[41] = 67'h7305049875da8631b;
    stim[42] = 67'h721e11a09dfe8e930;
    stim[43] = 67'h0adf3e58c97589e0f;
    stim[44] = 67'h512da4136a4950077;
    stim[45] = 67'h7434ce427a4b20165;
    stim[46] = 67'h5be78233944e669bd;
    stim[47] = 67'h645f07e643fa4b913;
    stim[48] = 67'h1cfa33d96729f1e86;
    stim[49] = 67'h6455a6367ac9d1ff8;
    stim[50] = 67'h193a1ac80715973ee;
    stim[51] = 67'h26d2b4037247f54bc;
    stim[52] = 67'h46d0ff5052130076c;
    stim[53] = 67'h1e2e4c7c6a223573f;
    stim[54] = 67'h2c587f8e3480162d2;
    stim[55] = 67'h452cfc8b91655e4ea;
    stim[56] = 67'h3e49f5e230afa3d54;
    stim[57] = 67'h2b9d065aa4484f8f4;
    stim[58] = 67'h6b491adac108a0cc3;
    stim[59] = 67'h14e34e03bc2cee53c;
    stim[60] = 67'h4f4f478bad76e5879;
    stim[61] = 67'h50c272849a89ab430;
    stim[62] = 67'h4ad445908e7701032;
    stim[63] = 67'h66260a10c17113f83;
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
      expv[0] = 34'hxxxxxxxxx;
      expv[1] = 34'hx00000000;
      expv[2] = 34'h36b1c330a;
      expv[3] = 34'h0ca501406;
      expv[4] = 34'h000000000;
      expv[5] = 34'h1edae44a8;
      expv[6] = 34'h080304506;
      expv[7] = 34'h000000000;
      expv[8] = 34'h100000000;
      expv[9] = 34'h100000000;
      expv[10] = 34'h100000000;
      expv[11] = 34'h3f9550b3f;
      expv[12] = 34'h000000000;
      expv[13] = 34'h1e6338b0d;
      expv[14] = 34'h21474bf29;
      expv[15] = 34'h0defbd36f;
      expv[16] = 34'h000000000;
      expv[17] = 34'h177df7bf7;
      expv[18] = 34'h026820d6f;
      expv[19] = 34'h035fa3e0d;
      expv[20] = 34'h000000000;
      expv[21] = 34'h1ad7ffb6f;
      expv[22] = 34'h053438df3;
      expv[23] = 34'h017010a00;
      expv[24] = 34'h000000000;
      expv[25] = 34'h3396f4054;
      expv[26] = 34'h08cedeaf2;
      expv[27] = 34'h07ffaa7f1;
      expv[28] = 34'h215c6185c;
      expv[29] = 34'h000000000;
      expv[30] = 34'h100000000;
      expv[31] = 34'h100000000;
      expv[32] = 34'h314499605;
      expv[33] = 34'h04bf3ffeb;
      expv[34] = 34'h0d5bafb3f;
      expv[35] = 34'h046630f93;
      expv[36] = 34'h0f8e43a64;
      expv[37] = 34'h000000000;
      expv[38] = 34'h100000000;
      expv[39] = 34'h1f379bdaf;
      expv[40] = 34'h08c030884;
      expv[41] = 34'h03dbadcff;
      expv[42] = 34'h00dbf0553;
      expv[43] = 34'h220394067;
      expv[44] = 34'h000000000;
      expv[45] = 34'h100000000;
      expv[46] = 34'h100000000;
      expv[47] = 34'h100000000;
      expv[48] = 34'h14f4a98ee;
      expv[49] = 34'h000000000;
      expv[50] = 34'h3be3ef06b;
      expv[51] = 34'h000000000;
      expv[52] = 34'h1edafea97;
      expv[53] = 34'h0ada7feed;
      expv[54] = 34'h000000000;
      expv[55] = 34'h148002c18;
      expv[56] = 34'h00248b815;
      expv[57] = 34'h07ddfefee;
      expv[58] = 34'h05fba9fbf;
      expv[59] = 34'h05483742d;
      expv[60] = 34'h079dfdca7;
      expv[61] = 34'h043b0c408;
      expv[62] = 34'h0d6983b8f;
      expv[63] = 34'h014a80200;
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
