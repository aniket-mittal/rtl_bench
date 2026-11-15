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

  rtlpp_06692 dut (
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
    stim[0] = 65'h15caeea5093b6471e;
    stim[1] = 65'h13aaadd3ba782c7b2;
    stim[2] = 65'h13d0009e0ef0f0edf;
    stim[3] = 65'h0a892e7dc4482d771;
    stim[4] = 65'h0661c0886a8387da1;
    stim[5] = 65'h1a981e3ffb3455f0b;
    stim[6] = 65'h1d1fc59acbb28c0c9;
    stim[7] = 65'h002bffbd289d4cf1f;
    stim[8] = 65'h103b25dff71741897;
    stim[9] = 65'h1915cf810cefc84d7;
    stim[10] = 65'h1377fe9f5bf35d06f;
    stim[11] = 65'h0566a053d685e698d;
    stim[12] = 65'h1ab7ad868c8a6687f;
    stim[13] = 65'h1c4fd04fd288b6733;
    stim[14] = 65'h0954f30d719cbe14d;
    stim[15] = 65'h0d282fd7f7859b3a5;
    stim[16] = 65'h00f90059b357551ef;
    stim[17] = 65'h1e19e7d71e2e19bc1;
    stim[18] = 65'h0e38dcad06602d07f;
    stim[19] = 65'h112a76e26a1f09289;
    stim[20] = 65'h084bb25b9fbcd4a3f;
    stim[21] = 65'h09c9d624fda38b40d;
    stim[22] = 65'h03e9bd62a470a6121;
    stim[23] = 65'h0cf2f67b3ddf34993;
    stim[24] = 65'h08831cd8b0a6eccff;
    stim[25] = 65'h0638d8c86735afc21;
    stim[26] = 65'h14f3f7fdb83335afb;
    stim[27] = 65'h1a2113b56e3d103ec;
    stim[28] = 65'h1ae4c78df25e0d959;
    stim[29] = 65'h156bb1acb6d3d27e1;
    stim[30] = 65'h1b96b8ff62835e261;
    stim[31] = 65'h00ace2fc3f0fa85d3;
    stim[32] = 65'h1930854b2def128e1;
    stim[33] = 65'h016f91216305e4ec1;
    stim[34] = 65'h0ac53c6f43809f20f;
    stim[35] = 65'h10ad9881866785113;
    stim[36] = 65'h05a87e7adb4bec44d;
    stim[37] = 65'h123bf1bd0c3fd64cb;
    stim[38] = 65'h0277871aa92e79065;
    stim[39] = 65'h0c4ad18429103d233;
    stim[40] = 65'h11fbe59f8c621d84b;
    stim[41] = 65'h05a085352b7318ae1;
    stim[42] = 65'h1e015fa8e789941f3;
    stim[43] = 65'h027a508d71404319f;
    stim[44] = 65'h06cabdea6a95d23c7;
    stim[45] = 65'h0ed63ce77c1755f07;
    stim[46] = 65'h0288d39fb8eb8da73;
    stim[47] = 65'h0486acdac50f9bf5f;
    stim[48] = 65'h1d9f35f85acfe4921;
    stim[49] = 65'h0fb88e772445e97ed;
    stim[50] = 65'h05f9366d11262e061;
    stim[51] = 65'h150964843d1aae6dd;
    stim[52] = 65'h090e9c66908ec5eef;
    stim[53] = 65'h05c62a3e3bca41ec3;
    stim[54] = 65'h0d1d17c610dc15513;
    stim[55] = 65'h10495b527078b638d;
    stim[56] = 65'h0e52b9b12c9f1d0bd;
    stim[57] = 65'h0ee42d0350bd7d4ad;
    stim[58] = 65'h12fb8619ed8c26c45;
    stim[59] = 65'h00c31d9ef541c2883;
    stim[60] = 65'h10ce33fc1992bd931;
    stim[61] = 65'h1cd08e5c92f197401;
    stim[62] = 65'h0acb03c93ca706f69;
    stim[63] = 65'h01a9424721db7beed;
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
      expv[3] = 32'h3c1cb410;
      expv[4] = 32'h483fcd10;
      expv[5] = 32'he06bb070;
      expv[6] = 32'h6dab0a7b;
      expv[7] = 32'h5419c398;
      expv[8] = 32'h63c79427;
      expv[9] = 32'h38d4b8b5;
      expv[10] = 32'hdce7e758;
      expv[11] = 32'h6c4031b6;
      expv[12] = 32'h2f881e34;
      expv[13] = 32'h139830cc;
      expv[14] = 32'hd2da174e;
      expv[15] = 32'h87912562;
      expv[16] = 32'hdc29dfae;
      expv[17] = 32'hc3d13bcb;
      expv[18] = 32'haa903900;
      expv[19] = 32'hcd24b498;
      expv[20] = 32'h59710c0c;
      expv[21] = 32'h58fc94a4;
      expv[22] = 32'h801fdcea;
      expv[23] = 32'h37e82bd0;
      expv[24] = 32'h85533961;
      expv[25] = 32'hb44cf9bb;
      expv[26] = 32'hf2015e30;
      expv[27] = 32'h00000000;
      expv[28] = 32'h00000000;
      expv[29] = 32'haf2f6e94;
      expv[30] = 32'h5fe58db0;
      expv[31] = 32'h8358ca10;
      expv[32] = 32'h7efcbdc9;
      expv[33] = 32'h924dfaf0;
      expv[34] = 32'h47941120;
      expv[35] = 32'h1966e256;
      expv[36] = 32'h65d6ca6c;
      expv[37] = 32'hbb6e1dc4;
      expv[38] = 32'hfdde4c88;
      expv[39] = 32'he729819a;
      expv[40] = 32'h5ffdb839;
      expv[41] = 32'h88b9d06c;
      expv[42] = 32'he5e146f0;
      expv[43] = 32'h58fcba0f;
      expv[44] = 32'hc3a31a85;
      expv[45] = 32'hdac13999;
      expv[46] = 32'h5a1aa831;
      expv[47] = 32'h9490ad55;
      expv[48] = 32'h4515b64a;
      expv[49] = 32'h692a2520;
      expv[50] = 32'h68ae66c6;
      expv[51] = 32'h344f2380;
      expv[52] = 32'h1184592e;
      expv[53] = 32'h240c292c;
      expv[54] = 32'h647d2b51;
      expv[55] = 32'hb2d9a7b0;
      expv[56] = 32'h8704b0b2;
      expv[57] = 32'hd545a04e;
      expv[58] = 32'h8e60bcbc;
      expv[59] = 32'h9d8a257e;
      expv[60] = 32'h7ed776b7;
      expv[61] = 32'h92d96d00;
      expv[62] = 32'h3b79a800;
      expv[63] = 32'ha476fa54;
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
