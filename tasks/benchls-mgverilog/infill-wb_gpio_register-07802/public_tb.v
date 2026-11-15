// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 40;
  localparam OW = 65;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_07802 dut (
    .wb_clk_i(clk),
    .wb_rst_i(in_vec[39:39]),
    .wb_dat_i(in_vec[38:7]),
    .wb_we_i(in_vec[6:6]),
    .wb_sel_i(in_vec[5:2]),
    .wb_stb_i(in_vec[1:1]),
    .wb_cyc_i(in_vec[0:0]),
    .wb_dat_o(out_vec[64:33]),
    .wb_ack_o(out_vec[32:32]),
    .port_output(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 40'ha9f42892fe;
    stim[1] = 40'hd5cefddbec;
    stim[2] = 40'h02f6f6cc93;
    stim[3] = 40'h4e679c9f00;
    stim[4] = 40'h6df4351435;
    stim[5] = 40'h2e07aa4006;
    stim[6] = 40'h4010a8c0e2;
    stim[7] = 40'h48fce900fc;
    stim[8] = 40'h6653a79371;
    stim[9] = 40'h5d92fc0576;
    stim[10] = 40'h2e76fc9fe1;
    stim[11] = 40'h7fca902766;
    stim[12] = 40'h7adf116ac3;
    stim[13] = 40'h18c69ed0d6;
    stim[14] = 40'h34cb5951d6;
    stim[15] = 40'h2eaa311955;
    stim[16] = 40'h06c1f2574a;
    stim[17] = 40'h70873abbaa;
    stim[18] = 40'h7ff1c8f81d;
    stim[19] = 40'h126eba4653;
    stim[20] = 40'h19f624d18b;
    stim[21] = 40'h7603bc9e74;
    stim[22] = 40'h44742a54e3;
    stim[23] = 40'h1be3f66caf;
    stim[24] = 40'h6676149338;
    stim[25] = 40'h2d68659dea;
    stim[26] = 40'h6bd282dcff;
    stim[27] = 40'h62736c5d59;
    stim[28] = 40'h7027ed3e9d;
    stim[29] = 40'h082ad7250e;
    stim[30] = 40'h2a387f1fe3;
    stim[31] = 40'h14648ec571;
    stim[32] = 40'h79b37e039d;
    stim[33] = 40'h3b262d7afd;
    stim[34] = 40'h3f87af2849;
    stim[35] = 40'h444d2d6e29;
    stim[36] = 40'h60df9b7711;
    stim[37] = 40'h597b9aabba;
    stim[38] = 40'h03d82eaa51;
    stim[39] = 40'h75fdfde17d;
    stim[40] = 40'h1b4b006976;
    stim[41] = 40'h1ecee0acd3;
    stim[42] = 40'h669abd1fc7;
    stim[43] = 40'h7227f8d861;
    stim[44] = 40'h670cb39e20;
    stim[45] = 40'h0c09d1aeeb;
    stim[46] = 40'h27fc792ef0;
    stim[47] = 40'h28c0c94573;
    stim[48] = 40'h0070134528;
    stim[49] = 40'h4ef345b9ea;
    stim[50] = 40'h07f9cc11e1;
    stim[51] = 40'h7b99c43665;
    stim[52] = 40'h2c06dda7f2;
    stim[53] = 40'h10d8550a4c;
    stim[54] = 40'h54df0f0045;
    stim[55] = 40'h375c607664;
    stim[56] = 40'h7aef5a7db9;
    stim[57] = 40'h24d84a3251;
    stim[58] = 40'h29cff93aba;
    stim[59] = 40'h38cd765cd4;
    stim[60] = 40'h4445576a4b;
    stim[61] = 40'h35a5989136;
    stim[62] = 40'h065342c67e;
    stim[63] = 40'h617b983514;
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
      expv[0] = 65'hxxxxxxxxxxxxxxxxx;
      expv[1] = 65'h00000000000000000;
      expv[2] = 65'h00000000100000000;
      expv[3] = 65'h00000000000000000;
      expv[4] = 65'h00000000000000000;
      expv[5] = 65'h00000000100000000;
      expv[6] = 65'h00000000100000000;
      expv[7] = 65'h10000000080000000;
      expv[8] = 65'h10000000080000000;
      expv[9] = 65'h10000000180000000;
      expv[10] = 65'h1764a0014bb25000a;
      expv[11] = 65'h1764a0015bb25000a;
      expv[12] = 65'h1fe4a009dff25004e;
      expv[13] = 65'h1fe4a009dff25004e;
      expv[14] = 65'h1ff1a0143ff8d00a1;
      expv[15] = 65'h1ff2c0146ff9600a3;
      expv[16] = 65'h1ff2c0147ff9600a3;
      expv[17] = 65'h1ff2dc947ff96e4a3;
      expv[18] = 65'h1ff2dc946ff96e4a3;
      expv[19] = 65'h1ff2dc947ff96e4a3;
      expv[20] = 65'h1ffbbc947ffdde4a3;
      expv[21] = 65'h1ffbbc946ffdde4a3;
      expv[22] = 65'h1ffbbc947ffdde4a3;
      expv[23] = 65'h111bbc94788dde4a3;
      expv[24] = 65'h111bbc94688dde4a3;
      expv[25] = 65'h111bbc94788dde4a3;
      expv[26] = 65'h0b5bb97475addcba3;
      expv[27] = 65'h1af4a0b72d7a505b9;
      expv[28] = 65'h1af4a0b72d7a505b9;
      expv[29] = 65'h1af4a0b73d7a505b9;
      expv[30] = 65'h1af4a0b73d7a505b9;
      expv[31] = 65'h0a94a0b7254a505b9;
      expv[32] = 65'h0a94a0b7254a505b9;
      expv[33] = 65'h0a94a0b7254a505b9;
      expv[34] = 65'h0a94a0b7254a505b9;
      expv[35] = 65'h0a94a0b7254a505b9;
      expv[36] = 65'h0a94a0b7254a505b9;
      expv[37] = 65'h0a94a0b7354a505b9;
      expv[38] = 65'h0a94a0b7254a505b9;
      expv[39] = 65'h0a94a0b7254a505b9;
      expv[40] = 65'h0a94a0b7354a505b9;
      expv[41] = 65'h06d2c0ba5369605d2;
      expv[42] = 65'h06d3a0ba5369d05d2;
      expv[43] = 65'h06d3a0a7e369d053f;
      expv[44] = 65'h06d3a0a7e369d053f;
      expv[45] = 65'h06d3a0a7f369d053f;
      expv[46] = 65'h0313b467e189da33f;
      expv[47] = 65'h0313b467f189da33f;
      expv[48] = 65'h0a303467e5181a33f;
      expv[49] = 65'h0a303467f5181a33f;
      expv[50] = 65'h13b03167e9d818b3f;
      expv[51] = 65'h13b03167e9d818b3f;
      expv[52] = 65'h13b03167f9d818b3f;
      expv[53] = 65'h0b01b167e580d8b3f;
      expv[54] = 65'h0b01b167e580d8b3f;
      expv[55] = 65'h0b01b167e580d8b3f;
      expv[56] = 65'h0b01b167e580d8b3f;
      expv[57] = 65'h0b01b167e580d8b3f;
      expv[58] = 65'h0b01b167f580d8b3f;
      expv[59] = 65'h0b01b167e580d8b3f;
      expv[60] = 65'h0b01b167f580d8b3f;
      expv[61] = 65'h0b01b5c7f580dae3f;
      expv[62] = 65'h0b01b5c7f580dae3f;
      expv[63] = 65'h0194d0b180ca6858c;
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
