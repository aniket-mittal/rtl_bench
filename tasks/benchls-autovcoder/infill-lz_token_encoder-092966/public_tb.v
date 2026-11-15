// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 56;
  localparam OW = 44;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_092966 dut (
    .data(in_vec[55:32]),
    .bytenum(in_vec[31:0]),
    .tokenpos(out_vec[43:28]),
    .tokenleng(out_vec[27:19]),
    .lit_leng(out_vec[18:2]),
    .lit_minus(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 56'h30d647b69a2f15;
    stim[1] = 56'hd25cee2b67ac2a;
    stim[2] = 56'h13dbefab74ed4d;
    stim[3] = 56'h65d31856dc8cae;
    stim[4] = 56'hb529a41a9dbab4;
    stim[5] = 56'h90c10ba1e54558;
    stim[6] = 56'h83c5e72c2e8ec8;
    stim[7] = 56'hd6f74d3e75ce02;
    stim[8] = 56'h612f00a6d38a91;
    stim[9] = 56'h6e7a2cb1321803;
    stim[10] = 56'h0aaf882db4f9e6;
    stim[11] = 56'hfb27fcfe67bc2d;
    stim[12] = 56'ha956ef1ecd4349;
    stim[13] = 56'h80394b81e6249f;
    stim[14] = 56'h87122059dc3ae5;
    stim[15] = 56'haf6ba29a83e2c9;
    stim[16] = 56'hb384967b891e2d;
    stim[17] = 56'h505c56213d1cd0;
    stim[18] = 56'h4ce62b292d46e5;
    stim[19] = 56'he51fb1711066b7;
    stim[20] = 56'h21e53fa03764e0;
    stim[21] = 56'h986461c93dcd27;
    stim[22] = 56'hc0689d5f38b615;
    stim[23] = 56'h97cea8c8e61d88;
    stim[24] = 56'h375a51709c44ca;
    stim[25] = 56'h48330f155afc05;
    stim[26] = 56'hcb7b9bf760aac7;
    stim[27] = 56'h1ab1cb109ecc27;
    stim[28] = 56'h0a5648ed402e70;
    stim[29] = 56'h3dc032cacd7a3d;
    stim[30] = 56'h51adf2ceeed11a;
    stim[31] = 56'hf1e0376fd93286;
    stim[32] = 56'h842e0779c1661c;
    stim[33] = 56'h3771cfea6557e6;
    stim[34] = 56'h65280bd00fcf9d;
    stim[35] = 56'hf5bbf0302b13f5;
    stim[36] = 56'hd69259668dbbce;
    stim[37] = 56'h8fca0eb8a56002;
    stim[38] = 56'hec5a4f6dab9388;
    stim[39] = 56'h8dae59face87bd;
    stim[40] = 56'hfb3698365cd812;
    stim[41] = 56'h1740d15e7299c4;
    stim[42] = 56'he5d98f6f3339e5;
    stim[43] = 56'h91c9c4c79b4826;
    stim[44] = 56'h1641491928d380;
    stim[45] = 56'had9ce103b6c772;
    stim[46] = 56'hbb4eb76fdb2838;
    stim[47] = 56'h7c345b8d0e6c02;
    stim[48] = 56'h41b81c86345d00;
    stim[49] = 56'h1593e09daa12cb;
    stim[50] = 56'hd98a9fd0052a8f;
    stim[51] = 56'hcfac71082c51bd;
    stim[52] = 56'h5e3595c892226a;
    stim[53] = 56'h5474f41f90e608;
    stim[54] = 56'hf4aaf3c1bf2494;
    stim[55] = 56'h038d57212ccab8;
    stim[56] = 56'h743a23c9a69b56;
    stim[57] = 56'h5593143c4ed6ed;
    stim[58] = 56'h86ce7e87850140;
    stim[59] = 56'h69481b806861f9;
    stim[60] = 56'hf267fb2d16a5a0;
    stim[61] = 56'h1252366a8d403f;
    stim[62] = 56'h014cf42d48604b;
    stim[63] = 56'hcc8492358d681b;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 44'h000706f43ex;
      expv[1] = 44'h3fff1a8000x;
      expv[2] = 44'h07ff028000x;
      expv[3] = 44'h7fff028000x;
      expv[4] = 44'h7fff048000x;
      expv[5] = 44'h0000128000x;
      expv[6] = 44'h000010dc56x;
      expv[7] = 44'h3fff1b0000x;
      expv[8] = 44'h7fff020000x;
      expv[9] = 44'h3fff0e0000x;
      expv[10] = 44'h3fff018000x;
      expv[11] = 44'h0000169104x;
      expv[12] = 44'h7fff030000x;
      expv[13] = 44'h000010f6e0x;
      expv[14] = 44'h0000110000x;
      expv[15] = 44'h0000160758x;
      expv[16] = 44'h0000168000x;
      expv[17] = 44'h00000a8000x;
      expv[18] = 44'h00000a0000x;
      expv[19] = 44'h7fff028000x;
      expv[20] = 44'h7fff020000x;
      expv[21] = 44'h0000138000x;
      expv[22] = 44'h00000a8000x;
      expv[23] = 44'h00001378a7x;
      expv[24] = 44'h0003070000x;
      expv[25] = 44'h000002c103x;
      expv[26] = 44'h0000198000x;
      expv[27] = 44'h3fff038000x;
      expv[28] = 44'h3fff018000x;
      expv[29] = 44'h7fff058000x;
      expv[30] = 44'h7fff040000x;
      expv[31] = 44'h7fff040000x;
      expv[32] = 44'h00000e0000x;
      expv[33] = 44'h0003070000x;
      expv[34] = 44'h7fff028000x;
      expv[35] = 44'h7fff048000x;
      expv[36] = 44'h3fff1b0000x;
      expv[37] = 44'h0000010000x;
      expv[38] = 44'h00001e1b2dx;
      expv[39] = 44'h7fff038000x;
      expv[40] = 44'h0000090000x;
      expv[41] = 44'h03ff035990x;
      expv[42] = 44'h7fff028000x;
      expv[43] = 44'h7fff040000x;
      expv[44] = 44'h3fff030000x;
      expv[45] = 44'h7fff038000x;
      expv[46] = 44'h000017b5fdx;
      expv[47] = 44'h0000016507x;
      expv[48] = 44'h7fff020000x;
      expv[49] = 44'h7fff048000x;
      expv[50] = 44'h7fff050000x;
      expv[51] = 44'h00001a0000x;
      expv[52] = 44'h3fff0c0000x;
      expv[53] = 44'h0000040000x;
      expv[54] = 44'h00004973c6x;
      expv[55] = 44'h7fff008000x;
      expv[56] = 44'h00000f5932x;
      expv[57] = 44'h7fff048000x;
      expv[58] = 44'h3fff110000x;
      expv[59] = 44'h7fff030000x;
      expv[60] = 44'h3fff1e8000x;
      expv[61] = 44'h3fff028000x;
      expv[62] = 44'h7fff020000x;
      expv[63] = 44'h00000d8000x;
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
