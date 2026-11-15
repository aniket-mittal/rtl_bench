// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 91;
  localparam OW = 15;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_02664 dut (
    .clk(clk),
    .rst(in_vec[90:90]),
    .start(in_vec[89:89]),
    .last(in_vec[88:88]),
    .addr_tuple(in_vec[87:72]),
    .way_tuple(in_vec[71:64]),
    .ddata(in_vec[63:0]),
    .next(out_vec[14:14]),
    .plc_error(out_vec[13:13]),
    .read_en(out_vec[12:12]),
    .addr_out(out_vec[11:4]),
    .way_out(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 91'h72aed7be5e70a88c2df69b7;
    stim[1] = 91'h7a70533b5951b61e9304192;
    stim[2] = 91'h2cc76c5e68d87e422e63bcc;
    stim[3] = 91'h326180b9f23c83fcd03f267;
    stim[4] = 91'h16fc39e82a44046d0c74479;
    stim[5] = 91'h38c53d70b9d30a4be2206ee;
    stim[6] = 91'h0c1e67ff5ef9e57e1d134ec;
    stim[7] = 91'h18f95ec5601f489202fbebf;
    stim[8] = 91'h1874e22604f7014aae1b4c9;
    stim[9] = 91'h05c9dcf2593d646bc3b16ff;
    stim[10] = 91'h09816a93679853adf959f21;
    stim[11] = 91'h06a0b30c7e1fba23ec63105;
    stim[12] = 91'h2bf171891c698349564bd14;
    stim[13] = 91'h30c347cf034ef63eb6137b1;
    stim[14] = 91'h012986b3370f1167b3129f7;
    stim[15] = 91'h2897926c4b453b1687c0d3a;
    stim[16] = 91'h20eabd092cc7c305437f307;
    stim[17] = 91'h2394985c18eb6d9b990adf3;
    stim[18] = 91'h14392a51d31d92837a4dae8;
    stim[19] = 91'h1329bbb895750cbb9484233;
    stim[20] = 91'h6eca39d88f208226ea9be82;
    stim[21] = 91'h318249335e4eeb582c797cb;
    stim[22] = 91'h17da753274659832595363b;
    stim[23] = 91'h2d50f8cecff8e3c2b682e24;
    stim[24] = 91'h26cc463b0ad7a4a17461493;
    stim[25] = 91'h28b247595b8dc939bb2a221;
    stim[26] = 91'h13e0e1a4bc38d183c5e035c;
    stim[27] = 91'h1f2ac94ad3ad635ea82452e;
    stim[28] = 91'h28801f32923bddbb3fdb12d;
    stim[29] = 91'h0cb533d71c0c92a515fc50c;
    stim[30] = 91'h286cb53f4c878ae0a07c41b;
    stim[31] = 91'h09b2394aa134e4dd2598d17;
    stim[32] = 91'h13efe26037ebcd7dab1556c;
    stim[33] = 91'h35e079e0e5d768b3ea41024;
    stim[34] = 91'h137e53b1d7d9fa352431c26;
    stim[35] = 91'h03b2805612af5c7a39973a5;
    stim[36] = 91'h30bbf412b7578c406a3c2f7;
    stim[37] = 91'h34ed1b73c39951235fde6c3;
    stim[38] = 91'h2ab7a5df9661a387ec5c427;
    stim[39] = 91'h1a7d444cd0797039bb51a0a;
    stim[40] = 91'h05512fd0ca9e4f234038516;
    stim[41] = 91'h3955e4993e65f051693c7f4;
    stim[42] = 91'h343543fc6e3fc178e53ae0c;
    stim[43] = 91'h2cf79e7375eeb6f3d4db709;
    stim[44] = 91'h3d77d2a1587ebe680f00e6d;
    stim[45] = 91'h0584674184a1c371cb2f3b4;
    stim[46] = 91'h20a7e7efd00f13ca1121ccd;
    stim[47] = 91'h3392263ddafca7285b138dd;
    stim[48] = 91'h120901037df455c967b3e4f;
    stim[49] = 91'h293cfb6ef519dae2655e046;
    stim[50] = 91'h12ac2e81bb4754187b4e25e;
    stim[51] = 91'h199e9bf53d7958f6e6f1401;
    stim[52] = 91'h006339f15d6ec9e12752744;
    stim[53] = 91'h399903d5ce0496e5b4310ca;
    stim[54] = 91'h390e6b387b53527c31d0588;
    stim[55] = 91'h252d70e0d6221429621e442;
    stim[56] = 91'h285e818ee46631dd508627b;
    stim[57] = 91'h258db31a5840dd5c139c050;
    stim[58] = 91'h0fe958a6b0a69c88a3cf015;
    stim[59] = 91'h31700b4de355c11dcecb7ae;
    stim[60] = 91'h126fbc232d42a95dff202db;
    stim[61] = 91'h058a080db890992ce1c1fcc;
    stim[62] = 91'h3ec9ad3016d5b4d2f6a8ef4;
    stim[63] = 91'h331b464873e7afd76283d98;
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
      expv[0] = 15'h0xxx;
      expv[1] = 15'h0xxx;
      expv[2] = 15'h0xxx;
      expv[3] = 15'h1ccc;
      expv[4] = 15'h518b;
      expv[5] = 15'h418b;
      expv[6] = 15'h618b;
      expv[7] = 15'h618b;
      expv[8] = 15'h618b;
      expv[9] = 15'h618b;
      expv[10] = 15'h618b;
      expv[11] = 15'h618b;
      expv[12] = 15'h618b;
      expv[13] = 15'h3bf1;
      expv[14] = 15'h734c;
      expv[15] = 15'h634c;
      expv[16] = 15'h634c;
      expv[17] = 15'h30ed;
      expv[18] = 15'h7495;
      expv[19] = 15'h343a;
      expv[20] = 15'h09bb;
      expv[21] = 15'h09bb;
      expv[22] = 15'h1189;
      expv[23] = 15'h5a73;
      expv[24] = 15'h4a73;
      expv[25] = 15'h6a73;
      expv[26] = 15'h38b7;
      expv[27] = 15'h70ea;
      expv[28] = 15'h60ea;
      expv[29] = 15'h60ea;
      expv[30] = 15'h60ea;
      expv[31] = 15'h3865;
      expv[32] = 15'h7234;
      expv[33] = 15'h33e2;
      expv[34] = 15'h707e;
      expv[35] = 15'h607e;
      expv[36] = 15'h607e;
      expv[37] = 15'h30b4;
      expv[38] = 15'h7d17;
      expv[39] = 15'h6d17;
      expv[40] = 15'h6d17;
      expv[41] = 15'h6d17;
      expv[42] = 15'h3954;
      expv[43] = 15'h754f;
      expv[44] = 15'h654f;
      expv[45] = 15'h654f;
      expv[46] = 15'h654f;
      expv[47] = 15'h30a7;
      expv[48] = 15'h7223;
      expv[49] = 15'h6223;
      expv[50] = 15'h6223;
      expv[51] = 15'h6223;
      expv[52] = 15'h6223;
      expv[53] = 15'h6223;
      expv[54] = 15'h3993;
      expv[55] = 15'h7e63;
      expv[56] = 15'h6e63;
      expv[57] = 15'h6e63;
      expv[58] = 15'h3583;
      expv[59] = 15'h795a;
      expv[60] = 15'h317b;
      expv[61] = 15'h7fb2;
      expv[62] = 15'h6fb2;
      expv[63] = 15'h6fb2;
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
