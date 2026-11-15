// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 65;
  localparam OW = 28;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_04464 dut (
    .mclock(clk),
    .reset_n(in_vec[64:64]),
    .pixclk(in_vec[63:63]),
    .crt_clock(in_vec[62:62]),
    .crt_gnt(in_vec[61:61]),
    .crt_req(in_vec[60:60]),
    .crt_org(in_vec[59:39]),
    .crt_page(in_vec[38:34]),
    .crt_ptch(in_vec[33:22]),
    .crt_x(in_vec[21:12]),
    .crt_y(in_vec[11:0]),
    .crt_ready(out_vec[27:27]),
    .crt_arb_req(out_vec[26:26]),
    .crt_arb_page(out_vec[25:21]),
    .crt_arb_addr(out_vec[20:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 65'h00594a7f251a76198;
    stim[1] = 65'h0e514a3e470d4840a;
    stim[2] = 65'h106c40c093fad1633;
    stim[3] = 65'h1742b1d9b76d44a84;
    stim[4] = 65'h1c070a8a7aa7cb13f;
    stim[5] = 65'h1012c9dd7f15ac545;
    stim[6] = 65'h17fd3b88ed5d69ba5;
    stim[7] = 65'h161a547de60e4b6d5;
    stim[8] = 65'h1a2e2ed2942697703;
    stim[9] = 65'h1f09715c81c0e4717;
    stim[10] = 65'h13c0fc71ddacda205;
    stim[11] = 65'h18517ddc06851a873;
    stim[12] = 65'h1979fb5433e3b3999;
    stim[13] = 65'h1e0374d6ea40b38a6;
    stim[14] = 65'h132223047f5d71ca0;
    stim[15] = 65'h1ab80878f10d06067;
    stim[16] = 65'h1423de30b1f50196f;
    stim[17] = 65'h1761351b98057b11d;
    stim[18] = 65'h139ebd74f89a6d452;
    stim[19] = 65'h182c5483fdc34b8f3;
    stim[20] = 65'h1ac97bc4f83f04d73;
    stim[21] = 65'h1832463a9583c92c9;
    stim[22] = 65'h1bc98d10b1430b1a4;
    stim[23] = 65'h17c620024b4d2ea97;
    stim[24] = 65'h105a7129b2f9013e3;
    stim[25] = 65'h1ced4cbea3c398dbf;
    stim[26] = 65'h16cd1c918a3882e5d;
    stim[27] = 65'h10fa55fa608bc68c1;
    stim[28] = 65'h165fb986f26c11626;
    stim[29] = 65'h1689ab9a362b79eeb;
    stim[30] = 65'h1bc51a1219e94df63;
    stim[31] = 65'h173f8b6981f465507;
    stim[32] = 65'h1cf93757b7e2b2fa9;
    stim[33] = 65'h1c6ae64870809872e;
    stim[34] = 65'h1a94a7fc076bb6a57;
    stim[35] = 65'h1c795df7a9feb37a2;
    stim[36] = 65'h1e087cfdf2c728b94;
    stim[37] = 65'h12304c4fe2942eea0;
    stim[38] = 65'h1ae3d1fe1502c9169;
    stim[39] = 65'h1d5577d1fb9c62368;
    stim[40] = 65'h136ae3a3981dacec7;
    stim[41] = 65'h13e7e5744d97c5b52;
    stim[42] = 65'h1d2b2f81e5b71fe3a;
    stim[43] = 65'h1e3a9603db325d147;
    stim[44] = 65'h180f632da454b6b8b;
    stim[45] = 65'h1351b89b09065e8b7;
    stim[46] = 65'h03f08ae781712114d;
    stim[47] = 65'h1403b0be9339d93cc;
    stim[48] = 65'h19d87605426cfa25a;
    stim[49] = 65'h1eabd2dd7abc00f22;
    stim[50] = 65'h1cc704c97e9f1faf7;
    stim[51] = 65'h1c7d9154152e85412;
    stim[52] = 65'h14d847ad5e41d4d20;
    stim[53] = 65'h184f4ab033dfd8b74;
    stim[54] = 65'h1080d4249d93ca509;
    stim[55] = 65'h1eb347ed74e9f0586;
    stim[56] = 65'h1aa9ab6363b7b79cf;
    stim[57] = 65'h11488cf0da36a4821;
    stim[58] = 65'h11623788b19909eae;
    stim[59] = 65'h1ef583a2b3add9dca;
    stim[60] = 65'h1692ee602821bdf25;
    stim[61] = 65'h17d2b0a92f6f965bd;
    stim[62] = 65'h155cbd436bc794ac8;
    stim[63] = 65'h0b7a9c3a17c9d155d;
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
      expv[0] = 28'h8000000;
      expv[1] = 28'h8000000;
      expv[2] = 28'h8000000;
      expv[3] = 28'h8000000;
      expv[4] = 28'h8000000;
      expv[5] = 28'h8000000;
      expv[6] = 28'h8000000;
      expv[7] = 28'h8000000;
      expv[8] = 28'h8000000;
      expv[9] = 28'h8000000;
      expv[10] = 28'h8000000;
      expv[11] = 28'h8000000;
      expv[12] = 28'h8000000;
      expv[13] = 28'h8000000;
      expv[14] = 28'h8000000;
      expv[15] = 28'h8000000;
      expv[16] = 28'h8000000;
      expv[17] = 28'h8000000;
      expv[18] = 28'h8000000;
      expv[19] = 28'h8000000;
      expv[20] = 28'h8000000;
      expv[21] = 28'h8000000;
      expv[22] = 28'h8000000;
      expv[23] = 28'h8000000;
      expv[24] = 28'h8000000;
      expv[25] = 28'h8000000;
      expv[26] = 28'h8000000;
      expv[27] = 28'h8000000;
      expv[28] = 28'h8000000;
      expv[29] = 28'h8000000;
      expv[30] = 28'h8000000;
      expv[31] = 28'h8000000;
      expv[32] = 28'h8000000;
      expv[33] = 28'h8000000;
      expv[34] = 28'h8000000;
      expv[35] = 28'h8000000;
      expv[36] = 28'h8000000;
      expv[37] = 28'h8000000;
      expv[38] = 28'h8000000;
      expv[39] = 28'h8000000;
      expv[40] = 28'h8000000;
      expv[41] = 28'h8000000;
      expv[42] = 28'h8000000;
      expv[43] = 28'h8000000;
      expv[44] = 28'h8000000;
      expv[45] = 28'h8000000;
      expv[46] = 28'h8000000;
      expv[47] = 28'h8000000;
      expv[48] = 28'h8000000;
      expv[49] = 28'h8000000;
      expv[50] = 28'h8000000;
      expv[51] = 28'h8000000;
      expv[52] = 28'h8000000;
      expv[53] = 28'h8000000;
      expv[54] = 28'h8000000;
      expv[55] = 28'h8000000;
      expv[56] = 28'h8000000;
      expv[57] = 28'h8000000;
      expv[58] = 28'h8000000;
      expv[59] = 28'h8000000;
      expv[60] = 28'h8000000;
      expv[61] = 28'h8000000;
      expv[62] = 28'h8000000;
      expv[63] = 28'h8000000;
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
