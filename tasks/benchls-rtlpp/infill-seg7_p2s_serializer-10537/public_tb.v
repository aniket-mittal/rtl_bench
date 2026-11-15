// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 52;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_10537 dut (
    .clk(clk),
    .flash(in_vec[51:51]),
    .Hexs(in_vec[50:19]),
    .LES(in_vec[18:11]),
    .point(in_vec[10:3]),
    .rst(in_vec[2:2]),
    .Start(in_vec[1:1]),
    .SW0(in_vec[0:0]),
    .seg_clk(out_vec[3:3]),
    .seg_clrn(out_vec[2:2]),
    .SEG_PEN(out_vec[1:1]),
    .seg_sout(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 52'h901abeb9dfb4c;
    stim[1] = 52'h2a3b5b3d22f9f;
    stim[2] = 52'h1eec8817ddce8;
    stim[3] = 52'h2430c4fde53fb;
    stim[4] = 52'h88c139797b5c8;
    stim[5] = 52'ha6e07a344240a;
    stim[6] = 52'hf6f9b8a0d11fb;
    stim[7] = 52'h6fc42b8ca832b;
    stim[8] = 52'h691536a4f85f1;
    stim[9] = 52'hec2c6b260aed2;
    stim[10] = 52'h779e1356c4e7b;
    stim[11] = 52'h2a4477661a8f1;
    stim[12] = 52'h82964f2425039;
    stim[13] = 52'ha0f0fd86fb480;
    stim[14] = 52'h201e48ae7f63b;
    stim[15] = 52'h6cb47fd1e3fa2;
    stim[16] = 52'hcb40691beada1;
    stim[17] = 52'h2107cee5f7e98;
    stim[18] = 52'h77de0fabbe753;
    stim[19] = 52'h4affd152d5483;
    stim[20] = 52'ha911e897c1bbb;
    stim[21] = 52'h769c27cf30e92;
    stim[22] = 52'h3e14fa33955ab;
    stim[23] = 52'hb79b97498bc03;
    stim[24] = 52'hdd5d8b106b209;
    stim[25] = 52'h9308f18f6ff01;
    stim[26] = 52'h9cc818deb44cb;
    stim[27] = 52'he03e11007d4f3;
    stim[28] = 52'hfdaeb095d27c7;
    stim[29] = 52'h0f28727b992fb;
    stim[30] = 52'h3f64e48151d80;
    stim[31] = 52'h439b9ca718f52;
    stim[32] = 52'h0f03ec9813271;
    stim[33] = 52'h0475f7105d0d3;
    stim[34] = 52'h57023822e773a;
    stim[35] = 52'h26d49a69294e8;
    stim[36] = 52'ha8f1c1def5798;
    stim[37] = 52'he25b9e5c18ed1;
    stim[38] = 52'ha26f2ba22a7f1;
    stim[39] = 52'h4421011d5f0aa;
    stim[40] = 52'h91af28ef314d8;
    stim[41] = 52'h01b471daed321;
    stim[42] = 52'hf6d2b29e5c428;
    stim[43] = 52'h133dbc28e5172;
    stim[44] = 52'h62473599a33d0;
    stim[45] = 52'h7f049e4bf6048;
    stim[46] = 52'h0e7aeab8fa63a;
    stim[47] = 52'h1183ecec309e8;
    stim[48] = 52'h79bd47f7890f2;
    stim[49] = 52'hfc3ab7ea7592a;
    stim[50] = 52'h5dbf99e5647cb;
    stim[51] = 52'h160e14aebf9fb;
    stim[52] = 52'hf68f04968a9b9;
    stim[53] = 52'hdfd272e1f1672;
    stim[54] = 52'hc372415529ee2;
    stim[55] = 52'ha65e0d3a8e7b8;
    stim[56] = 52'h19d780ff3d9b8;
    stim[57] = 52'h16f1a56c26f78;
    stim[58] = 52'h6ee0da2dfc943;
    stim[59] = 52'h6df9c31dfb49b;
    stim[60] = 52'h90525dc92ecb9;
    stim[61] = 52'h650cecf45b6a8;
    stim[62] = 52'hdf14c99325b0b;
    stim[63] = 52'hbf44f28a1e2ec;
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
      expv[0] = 4'h4;
      expv[1] = 4'h6;
      expv[2] = 4'h4;
      expv[3] = 4'h6;
      expv[4] = 4'h8;
      expv[5] = 4'ha;
      expv[6] = 4'ha;
      expv[7] = 4'ha;
      expv[8] = 4'h9;
      expv[9] = 4'hb;
      expv[10] = 4'hb;
      expv[11] = 4'h8;
      expv[12] = 4'h8;
      expv[13] = 4'h8;
      expv[14] = 4'ha;
      expv[15] = 4'ha;
      expv[16] = 4'h9;
      expv[17] = 4'h9;
      expv[18] = 4'hb;
      expv[19] = 4'hb;
      expv[20] = 4'ha;
      expv[21] = 4'ha;
      expv[22] = 4'hb;
      expv[23] = 4'hb;
      expv[24] = 4'h9;
      expv[25] = 4'h9;
      expv[26] = 4'hb;
      expv[27] = 4'hb;
      expv[28] = 4'h6;
      expv[29] = 4'h6;
      expv[30] = 4'h9;
      expv[31] = 4'hb;
      expv[32] = 4'h9;
      expv[33] = 4'hb;
      expv[34] = 4'ha;
      expv[35] = 4'h9;
      expv[36] = 4'h9;
      expv[37] = 4'h9;
      expv[38] = 4'h9;
      expv[39] = 4'hb;
      expv[40] = 4'h9;
      expv[41] = 4'h9;
      expv[42] = 4'h9;
      expv[43] = 4'hb;
      expv[44] = 4'h8;
      expv[45] = 4'h8;
      expv[46] = 4'ha;
      expv[47] = 4'h8;
      expv[48] = 4'ha;
      expv[49] = 4'hb;
      expv[50] = 4'hb;
      expv[51] = 4'ha;
      expv[52] = 4'h9;
      expv[53] = 4'hb;
      expv[54] = 4'hb;
      expv[55] = 4'h9;
      expv[56] = 4'h9;
      expv[57] = 4'h9;
      expv[58] = 4'hb;
      expv[59] = 4'ha;
      expv[60] = 4'h8;
      expv[61] = 4'h8;
      expv[62] = 4'ha;
      expv[63] = 4'h4;
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
