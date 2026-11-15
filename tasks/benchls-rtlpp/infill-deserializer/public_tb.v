// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 513;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  Deserializer dut (
    .clk(clk),
    .reset(in_vec[16:16]),
    .datain(in_vec[15:0]),
    .dataout0(out_vec[512:497]),
    .dataout1(out_vec[496:481]),
    .dataout2(out_vec[480:465]),
    .dataout3(out_vec[464:449]),
    .dataout4(out_vec[448:433]),
    .dataout5(out_vec[432:417]),
    .dataout6(out_vec[416:401]),
    .dataout7(out_vec[400:385]),
    .dataout8(out_vec[384:369]),
    .dataout9(out_vec[368:353]),
    .dataout10(out_vec[352:337]),
    .dataout11(out_vec[336:321]),
    .dataout12(out_vec[320:305]),
    .dataout13(out_vec[304:289]),
    .dataout14(out_vec[288:273]),
    .dataout15(out_vec[272:257]),
    .dataout16(out_vec[256:241]),
    .dataout17(out_vec[240:225]),
    .dataout18(out_vec[224:209]),
    .dataout19(out_vec[208:193]),
    .dataout20(out_vec[192:177]),
    .dataout21(out_vec[176:161]),
    .dataout22(out_vec[160:145]),
    .dataout23(out_vec[144:129]),
    .dataout24(out_vec[128:113]),
    .dataout25(out_vec[112:97]),
    .dataout26(out_vec[96:81]),
    .dataout27(out_vec[80:65]),
    .dataout28(out_vec[64:49]),
    .dataout29(out_vec[48:33]),
    .dataout30(out_vec[32:17]),
    .dataout31(out_vec[16:1]),
    .finish(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h13222;
    stim[1] = 17'h19980;
    stim[2] = 17'h0f300;
    stim[3] = 17'h043d1;
    stim[4] = 17'h07435;
    stim[5] = 17'h04d15;
    stim[6] = 17'h0d144;
    stim[7] = 17'h01c7c;
    stim[8] = 17'h05cb6;
    stim[9] = 17'h055da;
    stim[10] = 17'h01673;
    stim[11] = 17'h01626;
    stim[12] = 17'h056b3;
    stim[13] = 17'h04fe2;
    stim[14] = 17'h0b40b;
    stim[15] = 17'h03409;
    stim[16] = 17'h08314;
    stim[17] = 17'h01d51;
    stim[18] = 17'h0e9bd;
    stim[19] = 17'h02f1d;
    stim[20] = 17'h07e51;
    stim[21] = 17'h01eb8;
    stim[22] = 17'h06115;
    stim[23] = 17'h0c77a;
    stim[24] = 17'h09eed;
    stim[25] = 17'h0d10e;
    stim[26] = 17'h0f9d4;
    stim[27] = 17'h04911;
    stim[28] = 17'h07dda;
    stim[29] = 17'h0ae5b;
    stim[30] = 17'h04960;
    stim[31] = 17'h08f32;
    stim[32] = 17'h0be4e;
    stim[33] = 17'h02981;
    stim[34] = 17'h0e214;
    stim[35] = 17'h0a419;
    stim[36] = 17'h081b5;
    stim[37] = 17'h0910f;
    stim[38] = 17'h0f797;
    stim[39] = 17'h0bdea;
    stim[40] = 17'h039c8;
    stim[41] = 17'h065b1;
    stim[42] = 17'h0d382;
    stim[43] = 17'h0e3f2;
    stim[44] = 17'h0957e;
    stim[45] = 17'h07a80;
    stim[46] = 17'h02ef6;
    stim[47] = 17'h04e8d;
    stim[48] = 17'h088b4;
    stim[49] = 17'h08927;
    stim[50] = 17'h0641a;
    stim[51] = 17'h02f07;
    stim[52] = 17'h09cb3;
    stim[53] = 17'h0f4ae;
    stim[54] = 17'h01616;
    stim[55] = 17'h0d240;
    stim[56] = 17'h00fe5;
    stim[57] = 17'h0c57f;
    stim[58] = 17'h0e2bf;
    stim[59] = 17'h0f074;
    stim[60] = 17'h0c7d6;
    stim[61] = 17'h0cd46;
    stim[62] = 17'h0513b;
    stim[63] = 17'h0849d;
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
      expv[0] = 513'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 513'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[2] = 513'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[3] = 513'h1e60xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[4] = 513'h1e60087axxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[5] = 513'h1e60087a2e86xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[6] = 513'h1e60087a2e86a9a2xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[7] = 513'h1e60087a2e86a9a2ba28xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[8] = 513'h1e60087a2e86a9a2ba28838fxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[9] = 513'h1e60087a2e86a9a2ba28838f8b96xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[10] = 513'h1e60087a2e86a9a2ba28838f8b96cabbxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[11] = 513'h1e60087a2e86a9a2ba28838f8b96cabb42cexxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[12] = 513'h1e60087a2e86a9a2ba28838f8b96cabb42ce62c4xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[13] = 513'h1e60087a2e86a9a2ba28838f8b96cabb42ce62c4cad6xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[14] = 513'h1e60087a2e86a9a2ba28838f8b96cabb42ce62c4cad669fcxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[15] = 513'h1e60087a2e86a9a2ba28838f8b96cabb42ce62c4cad669fc5681xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[16] = 513'h1e60087a2e86a9a2ba28838f8b96cabb42ce62c4cad669fc56816681xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[17] = 513'h1e60087a2e86a9a2ba28838f8b96cabb42ce62c4cad669fc568166813062xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[18] = 513'h1e60087a2e86a9a2ba28838f8b96cabb42ce62c4cad669fc56816681306283aaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[19] = 513'h1e60087a2e86a9a2ba28838f8b96cabb42ce62c4cad669fc56816681306283aa3d37xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[20] = 513'h1e60087a2e86a9a2ba28838f8b96cabb42ce62c4cad669fc56816681306283aa3d37a5e3xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[21] = 513'h1e60087a2e86a9a2ba28838f8b96cabb42ce62c4cad669fc56816681306283aa3d37a5e3afcaxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[22] = 513'h1e60087a2e86a9a2ba28838f8b96cabb42ce62c4cad669fc56816681306283aa3d37a5e3afca23d7xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[23] = 513'h1e60087a2e86a9a2ba28838f8b96cabb42ce62c4cad669fc56816681306283aa3d37a5e3afca23d70c22xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[24] = 513'h1e60087a2e86a9a2ba28838f8b96cabb42ce62c4cad669fc56816681306283aa3d37a5e3afca23d70c22b8efxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[25] = 513'h1e60087a2e86a9a2ba28838f8b96cabb42ce62c4cad669fc56816681306283aa3d37a5e3afca23d70c22b8ef53ddxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[26] = 513'h1e60087a2e86a9a2ba28838f8b96cabb42ce62c4cad669fc56816681306283aa3d37a5e3afca23d70c22b8ef53ddba21xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[27] = 513'h1e60087a2e86a9a2ba28838f8b96cabb42ce62c4cad669fc56816681306283aa3d37a5e3afca23d70c22b8ef53ddba21df3axxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[28] = 513'h1e60087a2e86a9a2ba28838f8b96cabb42ce62c4cad669fc56816681306283aa3d37a5e3afca23d70c22b8ef53ddba21df3a8922xxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[29] = 513'h1e60087a2e86a9a2ba28838f8b96cabb42ce62c4cad669fc56816681306283aa3d37a5e3afca23d70c22b8ef53ddba21df3a89222fbbxxxxxxxxxxxxxxxxxxxxx;
      expv[30] = 513'h1e60087a2e86a9a2ba28838f8b96cabb42ce62c4cad669fc56816681306283aa3d37a5e3afca23d70c22b8ef53ddba21df3a89222fbb55cbxxxxxxxxxxxxxxxxx;
      expv[31] = 513'h1e60087a2e86a9a2ba28838f8b96cabb42ce62c4cad669fc56816681306283aa3d37a5e3afca23d70c22b8ef53ddba21df3a89222fbb55cb692cxxxxxxxxxxxxx;
      expv[32] = 513'h1e60087a2e86a9a2ba28838f8b96cabb42ce62c4cad669fc56816681306283aa3d37a5e3afca23d70c22b8ef53ddba21df3a89222fbb55cb692c11e6xxxxxxxxx;
      expv[33] = 513'h1e60087a2e86a9a2ba28838f8b96cabb42ce62c4cad669fc56816681306283aa3d37a5e3afca23d70c22b8ef53ddba21df3a89222fbb55cb692c11e657c9xxxxx;
      expv[34] = 513'h1e60087a2e86a9a2ba28838f8b96cabb42ce62c4cad669fc56816681306283aa3d37a5e3afca23d70c22b8ef53ddba21df3a89222fbb55cb692c11e657c9c5302;
      expv[35] = 513'h1e60087a2e86a9a2ba28838f8b96cabb42ce62c4cad669fc56816681306283aa3d37a5e3afca23d70c22b8ef53ddba21df3a89222fbb55cb692c11e657c9c5303;
      expv[36] = 513'h1e60087a2e86a9a2ba28838f8b96cabb42ce62c4cad669fc56816681306283aa3d37a5e3afca23d70c22b8ef53ddba21df3a89222fbb55cb692c11e657c9c5303;
      expv[37] = 513'h1e60087a2e86a9a2ba28838f8b96cabb42ce62c4cad669fc56816681306283aa3d37a5e3afca23d70c22b8ef53ddba21df3a89222fbb55cb692c11e657c9c5303;
      expv[38] = 513'h1e60087a2e86a9a2ba28838f8b96cabb42ce62c4cad669fc56816681306283aa3d37a5e3afca23d70c22b8ef53ddba21df3a89222fbb55cb692c11e657c9c5303;
      expv[39] = 513'h1e60087a2e86a9a2ba28838f8b96cabb42ce62c4cad669fc56816681306283aa3d37a5e3afca23d70c22b8ef53ddba21df3a89222fbb55cb692c11e657c9c5303;
      expv[40] = 513'h1e60087a2e86a9a2ba28838f8b96cabb42ce62c4cad669fc56816681306283aa3d37a5e3afca23d70c22b8ef53ddba21df3a89222fbb55cb692c11e657c9c5303;
      expv[41] = 513'h1e60087a2e86a9a2ba28838f8b96cabb42ce62c4cad669fc56816681306283aa3d37a5e3afca23d70c22b8ef53ddba21df3a89222fbb55cb692c11e657c9c5303;
      expv[42] = 513'h1e60087a2e86a9a2ba28838f8b96cabb42ce62c4cad669fc56816681306283aa3d37a5e3afca23d70c22b8ef53ddba21df3a89222fbb55cb692c11e657c9c5303;
      expv[43] = 513'h1e60087a2e86a9a2ba28838f8b96cabb42ce62c4cad669fc56816681306283aa3d37a5e3afca23d70c22b8ef53ddba21df3a89222fbb55cb692c11e657c9c5303;
      expv[44] = 513'h1e60087a2e86a9a2ba28838f8b96cabb42ce62c4cad669fc56816681306283aa3d37a5e3afca23d70c22b8ef53ddba21df3a89222fbb55cb692c11e657c9c5303;
      expv[45] = 513'h1e60087a2e86a9a2ba28838f8b96cabb42ce62c4cad669fc56816681306283aa3d37a5e3afca23d70c22b8ef53ddba21df3a89222fbb55cb692c11e657c9c5303;
      expv[46] = 513'h1e60087a2e86a9a2ba28838f8b96cabb42ce62c4cad669fc56816681306283aa3d37a5e3afca23d70c22b8ef53ddba21df3a89222fbb55cb692c11e657c9c5303;
      expv[47] = 513'h1e60087a2e86a9a2ba28838f8b96cabb42ce62c4cad669fc56816681306283aa3d37a5e3afca23d70c22b8ef53ddba21df3a89222fbb55cb692c11e657c9c5303;
      expv[48] = 513'h1e60087a2e86a9a2ba28838f8b96cabb42ce62c4cad669fc56816681306283aa3d37a5e3afca23d70c22b8ef53ddba21df3a89222fbb55cb692c11e657c9c5303;
      expv[49] = 513'h1e60087a2e86a9a2ba28838f8b96cabb42ce62c4cad669fc56816681306283aa3d37a5e3afca23d70c22b8ef53ddba21df3a89222fbb55cb692c11e657c9c5303;
      expv[50] = 513'h1e60087a2e86a9a2ba28838f8b96cabb42ce62c4cad669fc56816681306283aa3d37a5e3afca23d70c22b8ef53ddba21df3a89222fbb55cb692c11e657c9c5303;
      expv[51] = 513'h1e60087a2e86a9a2ba28838f8b96cabb42ce62c4cad669fc56816681306283aa3d37a5e3afca23d70c22b8ef53ddba21df3a89222fbb55cb692c11e657c9c5303;
      expv[52] = 513'h1e60087a2e86a9a2ba28838f8b96cabb42ce62c4cad669fc56816681306283aa3d37a5e3afca23d70c22b8ef53ddba21df3a89222fbb55cb692c11e657c9c5303;
      expv[53] = 513'h1e60087a2e86a9a2ba28838f8b96cabb42ce62c4cad669fc56816681306283aa3d37a5e3afca23d70c22b8ef53ddba21df3a89222fbb55cb692c11e657c9c5303;
      expv[54] = 513'h1e60087a2e86a9a2ba28838f8b96cabb42ce62c4cad669fc56816681306283aa3d37a5e3afca23d70c22b8ef53ddba21df3a89222fbb55cb692c11e657c9c5303;
      expv[55] = 513'h1e60087a2e86a9a2ba28838f8b96cabb42ce62c4cad669fc56816681306283aa3d37a5e3afca23d70c22b8ef53ddba21df3a89222fbb55cb692c11e657c9c5303;
      expv[56] = 513'h1e60087a2e86a9a2ba28838f8b96cabb42ce62c4cad669fc56816681306283aa3d37a5e3afca23d70c22b8ef53ddba21df3a89222fbb55cb692c11e657c9c5303;
      expv[57] = 513'h1e60087a2e86a9a2ba28838f8b96cabb42ce62c4cad669fc56816681306283aa3d37a5e3afca23d70c22b8ef53ddba21df3a89222fbb55cb692c11e657c9c5303;
      expv[58] = 513'h1e60087a2e86a9a2ba28838f8b96cabb42ce62c4cad669fc56816681306283aa3d37a5e3afca23d70c22b8ef53ddba21df3a89222fbb55cb692c11e657c9c5303;
      expv[59] = 513'h1e60087a2e86a9a2ba28838f8b96cabb42ce62c4cad669fc56816681306283aa3d37a5e3afca23d70c22b8ef53ddba21df3a89222fbb55cb692c11e657c9c5303;
      expv[60] = 513'h1e60087a2e86a9a2ba28838f8b96cabb42ce62c4cad669fc56816681306283aa3d37a5e3afca23d70c22b8ef53ddba21df3a89222fbb55cb692c11e657c9c5303;
      expv[61] = 513'h1e60087a2e86a9a2ba28838f8b96cabb42ce62c4cad669fc56816681306283aa3d37a5e3afca23d70c22b8ef53ddba21df3a89222fbb55cb692c11e657c9c5303;
      expv[62] = 513'h1e60087a2e86a9a2ba28838f8b96cabb42ce62c4cad669fc56816681306283aa3d37a5e3afca23d70c22b8ef53ddba21df3a89222fbb55cb692c11e657c9c5303;
      expv[63] = 513'h1e60087a2e86a9a2ba28838f8b96cabb42ce62c4cad669fc56816681306283aa3d37a5e3afca23d70c22b8ef53ddba21df3a89222fbb55cb692c11e657c9c5303;
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
