// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 45;
  localparam OW = 19;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_05437 dut (
    .clk(clk),
    .a(in_vec[44:29]),
    .wr(in_vec[28:28]),
    .vramdec(in_vec[27:27]),
    .cnt(in_vec[26:9]),
    .DinShiftR(in_vec[8:1]),
    .videoinverso(in_vec[0:0]),
    .cpuwait(out_vec[18:18]),
    .ASRAMVideo(out_vec[17:8]),
    .ACRAMVideo(out_vec[7:5]),
    .sramce(out_vec[4:4]),
    .cramce(out_vec[3:3]),
    .scramoe(out_vec[2:2]),
    .scramwr(out_vec[1:1]),
    .video(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 45'h14faaabeb451;
    stim[1] = 45'h05baa3dc15f7;
    stim[2] = 45'h0dcd81dcf78e;
    stim[3] = 45'h003506190638;
    stim[4] = 45'h1233761e42b3;
    stim[5] = 45'h169581b6be4c;
    stim[6] = 45'h09d62d9c9c27;
    stim[7] = 45'h13f9c85c2b38;
    stim[8] = 45'h0391faa5ef76;
    stim[9] = 45'h17424ae2fa0a;
    stim[10] = 45'h15e0b7458e63;
    stim[11] = 45'h17157bb1225f;
    stim[12] = 45'h040691238024;
    stim[13] = 45'h08d9cd971e55;
    stim[14] = 45'h0aedcf227d28;
    stim[15] = 45'h11006d47a081;
    stim[16] = 45'h15568f03d624;
    stim[17] = 45'h1ada04fafb9e;
    stim[18] = 45'h0cb67c7375aa;
    stim[19] = 45'h06364ebe6327;
    stim[20] = 45'h1cf978494e22;
    stim[21] = 45'h0a7d5c7afceb;
    stim[22] = 45'h052f5d0a3201;
    stim[23] = 45'h0c0985a55cf6;
    stim[24] = 45'h0369f1357f2f;
    stim[25] = 45'h0e450063f3c9;
    stim[26] = 45'h13f566e81a1d;
    stim[27] = 45'h1d486f25848b;
    stim[28] = 45'h0f9105a42061;
    stim[29] = 45'h16d35b1c0c58;
    stim[30] = 45'h001bb2a6faec;
    stim[31] = 45'h00c20a7d91f7;
    stim[32] = 45'h0068c117ec6f;
    stim[33] = 45'h1348dfb1806d;
    stim[34] = 45'h108a5a08d4fc;
    stim[35] = 45'h1bd289a3098e;
    stim[36] = 45'h02c226a5574a;
    stim[37] = 45'h116d12d16bd9;
    stim[38] = 45'h19ebcb0abc7c;
    stim[39] = 45'h12392f4ceb05;
    stim[40] = 45'h17e638a07aee;
    stim[41] = 45'h08ca93c6854c;
    stim[42] = 45'h1d632c478923;
    stim[43] = 45'h11ccbf1e3506;
    stim[44] = 45'h14914fac7454;
    stim[45] = 45'h1f0e1d851279;
    stim[46] = 45'h08d610d393c1;
    stim[47] = 45'h11dcbed25c29;
    stim[48] = 45'h11c00798a698;
    stim[49] = 45'h0beedebef727;
    stim[50] = 45'h0e614f3b3782;
    stim[51] = 45'h198d891622af;
    stim[52] = 45'h119031c132b7;
    stim[53] = 45'h1ed24a1ea26e;
    stim[54] = 45'h1f526f5fe6c9;
    stim[55] = 45'h0ee92c359b5f;
    stim[56] = 45'h029c5b4ba7d3;
    stim[57] = 45'h1d9e7c53e6fc;
    stim[58] = 45'h10789d34ee3a;
    stim[59] = 45'h0e5a3d6f5b1a;
    stim[60] = 45'h09c01ff82212;
    stim[61] = 45'h103b5dfbde9b;
    stim[62] = 45'h136681bda557;
    stim[63] = 45'h1caa85f704a5;
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
      expv[0] = 19'h6abxx;
      expv[1] = 19'h7c1ex;
      expv[2] = 19'h1cffx;
      expv[3] = 19'h610cx;
      expv[4] = 19'h604ex;
      expv[5] = 19'h5abax;
      expv[6] = 19'h589fx;
      expv[7] = 19'h442ex;
      expv[8] = 19'h6be22;
      expv[9] = 19'h6ef03;
      expv[10] = 19'h75822;
      expv[11] = 19'h7b293;
      expv[12] = 19'h53803;
      expv[13] = 19'h591ad;
      expv[14] = 19'h72702;
      expv[15] = 19'h55a23;
      expv[16] = 19'h71d03;
      expv[17] = 19'h4efc2;
      expv[18] = 19'h4778a;
      expv[19] = 19'h6a6e2;
      expv[20] = 19'h45442;
      expv[21] = 19'h46fc2;
      expv[22] = 19'h50342;
      expv[23] = 19'h5b522;
      expv[24] = 19'h537b3;
      expv[25] = 19'h47f0c;
      expv[26] = 19'h6e155;
      expv[27] = 19'h73835;
      expv[28] = 19'h5a222;
      expv[29] = 19'h700eb;
      expv[30] = 19'h6af22;
      expv[31] = 19'h679ec;
      expv[32] = 19'h51ea2;
      expv[33] = 19'h7b893;
      expv[34] = 19'h60d43;
      expv[35] = 19'h5b003;
      expv[36] = 19'h6b523;
      expv[37] = 19'h6d693;
      expv[38] = 19'h70b55;
      expv[39] = 19'h74e63;
      expv[40] = 19'h4a703;
      expv[41] = 19'h7c823;
      expv[42] = 19'h45835;
      expv[43] = 19'h703e3;
      expv[44] = 19'h7a763;
      expv[45] = 19'h59123;
      expv[46] = 19'h4d983;
      expv[47] = 19'h6c593;
      expv[48] = 19'h78ac3;
      expv[49] = 19'h6aff3;
      expv[50] = 19'h733c3;
      expv[51] = 19'h502a3;
      expv[52] = 19'h1d303;
      expv[53] = 19'h60ae3;
      expv[54] = 19'h75ee3;
      expv[55] = 19'h439a3;
      expv[56] = 19'h75a43;
      expv[57] = 19'h45e83;
      expv[58] = 19'h52ea3;
      expv[59] = 19'h57562;
      expv[60] = 19'h7e2c2;
      expv[61] = 19'h5fdc2;
      expv[62] = 19'h5bae2;
      expv[63] = 19'h5f0ac;
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
