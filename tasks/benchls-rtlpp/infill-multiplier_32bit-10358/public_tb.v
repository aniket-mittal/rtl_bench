// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 65;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_10358 dut (
    .clk(clk),
    .A_mul_src1(in_vec[64:33]),
    .A_mul_src2(in_vec[32:1]),
    .reset_n(in_vec[0:0]),
    .A_mul_cell_result(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 65'h18d44ff2ecd52416c;
    stim[1] = 65'h0b344021889f5d6b0;
    stim[2] = 65'h04e07884d2052ac49;
    stim[3] = 65'h18a5856389b8c3cbf;
    stim[4] = 65'h0b2924bfb8264917d;
    stim[5] = 65'h14df6cff2322d5901;
    stim[6] = 65'h13998e07c5c1625e3;
    stim[7] = 65'h09429b3e1c7794551;
    stim[8] = 65'h0e6a340f59a1dfefb;
    stim[9] = 65'h002dd4a136e2c7c3d;
    stim[10] = 65'h1706783038d1b3e0f;
    stim[11] = 65'h13bb732eb82deb1ab;
    stim[12] = 65'h03a55f8bceb29c0cf;
    stim[13] = 65'h01f2cf0ae5c570f3b;
    stim[14] = 65'h1e2a0dcf3234e4dd1;
    stim[15] = 65'h0b84ac58df846af63;
    stim[16] = 65'h17dc9fda871e1382a;
    stim[17] = 65'h0a7ebddb9271dbad7;
    stim[18] = 65'h155414f17f5b772fd;
    stim[19] = 65'h16369d0aabce88577;
    stim[20] = 65'h104f9f689ae31d493;
    stim[21] = 65'h04763a883fbf3ac55;
    stim[22] = 65'h149715325161d40e5;
    stim[23] = 65'h1225ada65074d6d53;
    stim[24] = 65'h12ecc26c9f9c92f11;
    stim[25] = 65'h0e7de7fa392f721f5;
    stim[26] = 65'h1857875fab4d7598f;
    stim[27] = 65'h0ad56631ec93a9c71;
    stim[28] = 65'h04aa4b540c21ff6e9;
    stim[29] = 65'h10c932237431b0313;
    stim[30] = 65'h0ad4dee0f594c49b9;
    stim[31] = 65'h1c8031f131fdd703b;
    stim[32] = 65'h033bfc50498b4fb8d;
    stim[33] = 65'h19f27f23d02549247;
    stim[34] = 65'h0c02d41989ddf3e27;
    stim[35] = 65'h143c84598d994b7ef;
    stim[36] = 65'h0634b8d258ea38eb1;
    stim[37] = 65'h1d5ba74c4871adeef;
    stim[38] = 65'h1158e781277da05f3;
    stim[39] = 65'h004dd04f54d0951cf;
    stim[40] = 65'h04d9b4bd5ec4ebc07;
    stim[41] = 65'h04836b7ca635c6944;
    stim[42] = 65'h18ebe2cc3c6ceb9ad;
    stim[43] = 65'h1da5123191425b0bb;
    stim[44] = 65'h1f84de0b4842f5185;
    stim[45] = 65'h08cce866352c67ff3;
    stim[46] = 65'h16f7d055e58c4c107;
    stim[47] = 65'h041729074df3d515f;
    stim[48] = 65'h159d52c779b131a5b;
    stim[49] = 65'h0e8caa3b9bed3c357;
    stim[50] = 65'h1a63ee3d04520ddf7;
    stim[51] = 65'h074269d9a3b4b4d1b;
    stim[52] = 65'h102c7bf21590ec197;
    stim[53] = 65'h19b6d82ad07ae332d;
    stim[54] = 65'h112f46f72136d5359;
    stim[55] = 65'h0bb2f3bc84fff0d2f;
    stim[56] = 65'h1082915200354727d;
    stim[57] = 65'h06d1d8d7090f57001;
    stim[58] = 65'h163f3c65d55cb4ae3;
    stim[59] = 65'h029915b7153ee04cb;
    stim[60] = 65'h1c84d08d871bfb0ff;
    stim[61] = 65'h1a8bee4006f57e7d7;
    stim[62] = 65'h0fd37575ed7d380f7;
    stim[63] = 65'h1af98d39b17bed6c9;
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
      expv[0] = 32'h00000000;
      expv[1] = 32'h00000000;
      expv[2] = 32'h00000000;
      expv[3] = 32'hc06c5958;
      expv[4] = 32'h58714764;
      expv[5] = 32'hd6f959c6;
      expv[6] = 32'h678f4880;
      expv[7] = 32'hfc5a065e;
      expv[8] = 32'hcf98e580;
      expv[9] = 32'h9db4e192;
      expv[10] = 32'hf6ef850e;
      expv[11] = 32'h2e996987;
      expv[12] = 32'hd476e659;
      expv[13] = 32'h591dc9d2;
      expv[14] = 32'he8bdae5b;
      expv[15] = 32'ha14a13a8;
      expv[16] = 32'h00000000;
      expv[17] = 32'h00000000;
      expv[18] = 32'h66fec1f4;
      expv[19] = 32'h1425e96a;
      expv[20] = 32'h730ba017;
      expv[21] = 32'h734fce64;
      expv[22] = 32'h829b28aa;
      expv[23] = 32'hc436c304;
      expv[24] = 32'h229ea202;
      expv[25] = 32'ha3aa4920;
      expv[26] = 32'hcb89e21a;
      expv[27] = 32'hd7f3d6ab;
      expv[28] = 32'h1e8c6948;
      expv[29] = 32'ha82bf080;
      expv[30] = 32'hef7d4273;
      expv[31] = 32'hf2394604;
      expv[32] = 32'hf357ba85;
      expv[33] = 32'h54c2aa8c;
      expv[34] = 32'h93449d1a;
      expv[35] = 32'h2f8ca324;
      expv[36] = 32'h4b7c16d4;
      expv[37] = 32'hee57c030;
      expv[38] = 32'h1926a18e;
      expv[39] = 32'h8a4176c1;
      expv[40] = 32'hb757cc16;
      expv[41] = 32'h00000000;
      expv[42] = 32'h00000000;
      expv[43] = 32'hd5879116;
      expv[44] = 32'h628affdc;
      expv[45] = 32'ha33d3434;
      expv[46] = 32'he3f969a9;
      expv[47] = 32'h777e7f8d;
      expv[48] = 32'hf60e6fa6;
      expv[49] = 32'h99fae75f;
      expv[50] = 32'hcca009f4;
      expv[51] = 32'h82c65e78;
      expv[52] = 32'h81bb54e9;
      expv[53] = 32'h0e084730;
      expv[54] = 32'h61f6ae64;
      expv[55] = 32'h0ce6914c;
      expv[56] = 32'h9113797c;
      expv[57] = 32'h8fd39ee0;
      expv[58] = 32'h9ed44000;
      expv[59] = 32'h9eb9ed4e;
      expv[60] = 32'hc487f998;
      expv[61] = 32'haed6d194;
      expv[62] = 32'h8cd3a600;
      expv[63] = 32'h958ebd15;
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
