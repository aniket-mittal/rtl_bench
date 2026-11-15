// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 101;
  localparam OW = 67;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_033226 dut (
    .pclk(clk),
    .presetn(in_vec[100:100]),
    .paddr(in_vec[99:68]),
    .psel(in_vec[67:67]),
    .penable(in_vec[66:66]),
    .pwrite(in_vec[65:65]),
    .pwdata(in_vec[64:33]),
    .din(in_vec[32:1]),
    .din_rdy(in_vec[0:0]),
    .pready(out_vec[66:66]),
    .prdata(out_vec[65:34]),
    .dout(out_vec[33:2]),
    .dout_rdy(out_vec[1:1]),
    .din_req(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 101'h01c0b1071e689be3a04c34dedb;
    stim[1] = 101'h0a1b4bd9f844ac5b61f089bd2c;
    stim[2] = 101'h19c3da8ec9eecde09af594e821;
    stim[3] = 101'h104dfb7c51fafbf79291c413d9;
    stim[4] = 101'h12068189240a745de9cc2b714c;
    stim[5] = 101'h1a489c1fd34d3e3a25f85d6d73;
    stim[6] = 101'h19d3bf2acc3620de346685087a;
    stim[7] = 101'h14f5f6885de1bb1fbd092617dd;
    stim[8] = 101'h048f6355d6261b728a0ff4d1d2;
    stim[9] = 101'h1d0f0a67ba793b8da7611dfb99;
    stim[10] = 101'h1bce534b729373f45948549218;
    stim[11] = 101'h1da0437a925b30652588aa4b63;
    stim[12] = 101'h1dc20c7809b9c1ae4dd941c4c1;
    stim[13] = 101'h1e89c9afe70f1c4574ce56ae9b;
    stim[14] = 101'h1963a7dea836aa6196de0685ae;
    stim[15] = 101'h1e98e6fefa2039168cc09a1721;
    stim[16] = 101'h140763d1d60d714c4e786a8a83;
    stim[17] = 101'h1b30224002920d58fd5be891be;
    stim[18] = 101'h122741c18507fba1469e982288;
    stim[19] = 101'h1a6aeb41944198ee23e1655db9;
    stim[20] = 101'h17341427538a0a639c70b05e8c;
    stim[21] = 101'h1a3b5e449e9ccd78c76fa7be16;
    stim[22] = 101'h1467af545f398bd723c8e409ce;
    stim[23] = 101'h083ffbd20040cef7aecce86de9;
    stim[24] = 101'h13e0014f8e220051b131062fc3;
    stim[25] = 101'h1791e973ccbcc3b442b5fa9889;
    stim[26] = 101'h1bb5258b7ec918edb46cf36402;
    stim[27] = 101'h1be6a7766cf7685723c767736a;
    stim[28] = 101'h1690cefb52fa9a02304e955676;
    stim[29] = 101'h108b2b4d2dc91df7a34c975957;
    stim[30] = 101'h155a13fbfadbc5d1f943d002ee;
    stim[31] = 101'h123994d97677c9e8c0b62025c3;
    stim[32] = 101'h1f9dfda49f345fede387500ede;
    stim[33] = 101'h1c7458a5d8f823088ecd09f3c4;
    stim[34] = 101'h1488813430c90d9ed13eb8a4a3;
    stim[35] = 101'h1836c5009aff06dcef2118d925;
    stim[36] = 101'h12d80614200e1e28c0658d1e8a;
    stim[37] = 101'h1c890cdaf43b51dd21435c111f;
    stim[38] = 101'h133cd16781bc28bbc6b453cc04;
    stim[39] = 101'h17a17c198a22974814676467fd;
    stim[40] = 101'h158be6b92543f3eb1c6f9de590;
    stim[41] = 101'h1e39fb378fb3be1c2958cfdde2;
    stim[42] = 101'h198f228cc2aed6f172b915bcab;
    stim[43] = 101'h19510cadf07b1c0e32b7bda3dd;
    stim[44] = 101'h1ccec80eb2d6871e41c3105865;
    stim[45] = 101'h1ef0dbec3ef93eee4cf05baf61;
    stim[46] = 101'h1fb8a5450b881c84071e1056c1;
    stim[47] = 101'h16741bd1855ce7b58ec05cde29;
    stim[48] = 101'h1f478b5fe11b082641de85701c;
    stim[49] = 101'h172c91a649d3d4310155ddcd54;
    stim[50] = 101'h1177f33c8015d6bd1890b5e4c7;
    stim[51] = 101'h191fff3c105f2556a1d884496e;
    stim[52] = 101'h13272ff2883e1a8eaf42bf89ce;
    stim[53] = 101'h11a32d89f3ce277d8971651852;
    stim[54] = 101'h19c061ae98196f17acc467cc89;
    stim[55] = 101'h15458c779de7e192fb385ba5c3;
    stim[56] = 101'h172194058a9a27e128e2db39f3;
    stim[57] = 101'h16bbc8d3ab738ac7472d2ce35c;
    stim[58] = 101'h14471f6dac39ff5435c72e6663;
    stim[59] = 101'h10589709d98afff08378eedbee;
    stim[60] = 101'h1ceada9853bc363a34464d546f;
    stim[61] = 101'h12c8f107f4f18e8745727f4479;
    stim[62] = 101'h10ab388060cd095b5850a97252;
    stim[63] = 101'h1b93a3d96f608facc75959f381;
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
      expv[0] = 67'hxxxxxxxxxxxxxxxxx;
      expv[1] = 67'h400000000d137c742;
      expv[2] = 67'h00000000000000001;
      expv[3] = 67'h5eb29d04000000001;
      expv[4] = 67'h00000000000000000;
      expv[5] = 67'h00000000000000000;
      expv[6] = 67'h00000000000000000;
      expv[7] = 67'h00000000000000001;
      expv[8] = 67'h6124c2fb800000001;
      expv[9] = 67'h00000000000000000;
      expv[10] = 67'h400000000f2771b4e;
      expv[11] = 67'h00000000000000000;
      expv[12] = 67'h00000000000000000;
      expv[13] = 67'h7b283898000000001;
      expv[14] = 67'h00000000000000000;
      expv[15] = 67'h00000000000000001;
      expv[16] = 67'h40000000040722d1a;
      expv[17] = 67'h00000000000000000;
      expv[18] = 67'h00000000000000000;
      expv[19] = 67'h00000000000000000;
      expv[20] = 67'h00000000000000000;
      expv[21] = 67'h00000000000000000;
      expv[22] = 67'h400000001399af18e;
      expv[23] = 67'h4000000027317ae46;
      expv[24] = 67'h00000000000000000;
      expv[25] = 67'h4000000004400a362;
      expv[26] = 67'h56bf5311000000001;
      expv[27] = 67'h4000000019231db6a;
      expv[28] = 67'h00000000000000001;
      expv[29] = 67'h00000000000000000;
      expv[30] = 67'h6992eb2ac00000001;
      expv[31] = 67'h400000001b78ba3f2;
      expv[32] = 67'h00000000000000000;
      expv[33] = 67'h40000000268bfdbc6;
      expv[34] = 67'h00000000000000001;
      expv[35] = 67'h00000000000000000;
      expv[36] = 67'h400000001fe0db9de;
      expv[37] = 67'h00000000000000000;
      expv[38] = 67'h00000000000000000;
      expv[39] = 67'h00000000000000000;
      expv[40] = 67'h400000000452e902a;
      expv[41] = 67'h00000000000000000;
      expv[42] = 67'h400000003677c3852;
      expv[43] = 67'h00000000000000000;
      expv[44] = 67'h00000000000000000;
      expv[45] = 67'h00000000000000000;
      expv[46] = 67'h400000001f27ddc9a;
      expv[47] = 67'h4000000031039080e;
      expv[48] = 67'h00000000000000000;
      expv[49] = 67'h00000000000000000;
      expv[50] = 67'h00000000000000001;
      expv[51] = 67'h00000000000000000;
      expv[52] = 67'h00000000000000000;
      expv[53] = 67'h00000000000000001;
      expv[54] = 67'h00000000000000000;
      expv[55] = 67'h588cf991000000001;
      expv[56] = 67'h670b74b8400000001;
      expv[57] = 67'h400000001344fc252;
      expv[58] = 67'h400000002e7158e8e;
      expv[59] = 67'h78e5cccc400000001;
      expv[60] = 67'h00000000000000001;
      expv[61] = 67'h00000000000000000;
      expv[62] = 67'h00000000000000000;
      expv[63] = 67'h00000000000000000;
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
