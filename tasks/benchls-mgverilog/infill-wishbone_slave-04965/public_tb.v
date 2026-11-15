// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 72;
  localparam OW = 34;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_04965 dut (
    .clk(clk),
    .rst(in_vec[71:71]),
    .i_wbs_we(in_vec[70:70]),
    .i_wbs_cyc(in_vec[69:69]),
    .i_wbs_sel(in_vec[68:65]),
    .i_wbs_dat(in_vec[64:33]),
    .i_wbs_stb(in_vec[32:32]),
    .i_wbs_adr(in_vec[31:0]),
    .o_wbs_ack(out_vec[33:33]),
    .o_wbs_dat(out_vec[32:1]),
    .o_wbs_int(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 72'hc8405a9d523e577334;
    stim[1] = 72'h8afd5b6a188b5395ba;
    stim[2] = 72'h066afd140b61b2c612;
    stim[3] = 72'h4138ecc304975c7766;
    stim[4] = 72'h431ca527d61d5fa738;
    stim[5] = 72'h7fa989ad5be29a5f7b;
    stim[6] = 72'h19f128753d6bbc556d;
    stim[7] = 72'h33b8fe0c7c3913797c;
    stim[8] = 72'h20fd06a86e61e85936;
    stim[9] = 72'h3e3b7b446d4586887e;
    stim[10] = 72'h56cadfb900fefa04cb;
    stim[11] = 72'h26cb6369c34cabd6df;
    stim[12] = 72'h39169fe54ddc45ef7a;
    stim[13] = 72'h6707c0c4736c08589c;
    stim[14] = 72'h3fcc25191b30cf67d7;
    stim[15] = 72'h6e1348b4aa8dc1ca97;
    stim[16] = 72'h7f50e96433c19fe66f;
    stim[17] = 72'h14df57c698099604a5;
    stim[18] = 72'h7df62ec4d2478e3bb3;
    stim[19] = 72'h146d1f338b38a0b8df;
    stim[20] = 72'h5ac57dc7564e12d808;
    stim[21] = 72'h76bdcc9f052826549e;
    stim[22] = 72'h65f26521b9b7c8d56f;
    stim[23] = 72'h3a4ba0d312e5e9b5b7;
    stim[24] = 72'h09087181dfe9f0d53e;
    stim[25] = 72'h671cb81699a74152b5;
    stim[26] = 72'h6ea2786d568b782f1b;
    stim[27] = 72'h4ab82f01c67eea7d23;
    stim[28] = 72'h026384e0ee6da9c520;
    stim[29] = 72'h0a56a3972399ada05b;
    stim[30] = 72'h6e22cd7a1583305f49;
    stim[31] = 72'h485c04a31477c431a3;
    stim[32] = 72'h3e049626bba26a6cc1;
    stim[33] = 72'h07e65bafbead14a169;
    stim[34] = 72'h6244b9190cc50aa7da;
    stim[35] = 72'h58578a1746b0fa3957;
    stim[36] = 72'h4ef59a43dcf97064f0;
    stim[37] = 72'h1ddc26c70abf41c854;
    stim[38] = 72'h5c4295087872d8a1d6;
    stim[39] = 72'h330295c72abfa51d9e;
    stim[40] = 72'h1675658ef5a04f27b3;
    stim[41] = 72'h452ef5b9f8f727f6c8;
    stim[42] = 72'h622a18a8ffdd649672;
    stim[43] = 72'h10b11c81d81bc08f25;
    stim[44] = 72'h529625e647fb73830d;
    stim[45] = 72'h7c6bb62bded116e654;
    stim[46] = 72'h769174c21848a06931;
    stim[47] = 72'h3b67c58f22b9c9ea31;
    stim[48] = 72'h4869638d0163c64b12;
    stim[49] = 72'h5c86b85f5d443a67c0;
    stim[50] = 72'h4e28e2a6ccab200a2d;
    stim[51] = 72'h3a2eb875706a45cfaf;
    stim[52] = 72'h088b25b19b87e67225;
    stim[53] = 72'h25441c8b0f3e0cb67a;
    stim[54] = 72'h4227629f089daa853c;
    stim[55] = 72'h4b75cf68db69c1bbca;
    stim[56] = 72'h5ab68f983b347273e5;
    stim[57] = 72'h120a517519553542dd;
    stim[58] = 72'h683bbb83b0949a4fc6;
    stim[59] = 72'h16da2480de7b2574e5;
    stim[60] = 72'h062fbe610238a1af59;
    stim[61] = 72'h4bc62bb0fd50312cf1;
    stim[62] = 72'h69c0737af6c52587ce;
    stim[63] = 72'h5ecbe264f1f54321d3;
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
      expv[0] = 34'hxxxxxxxxx;
      expv[1] = 34'h000000000;
      expv[2] = 34'h000000000;
      expv[3] = 34'h000000000;
      expv[4] = 34'h000000000;
      expv[5] = 34'h000000000;
      expv[6] = 34'h200000000;
      expv[7] = 34'h200000000;
      expv[8] = 34'h000000000;
      expv[9] = 34'h000000000;
      expv[10] = 34'h28b0d10fc;
      expv[11] = 34'h08b0d10fc;
      expv[12] = 34'h29957adbe;
      expv[13] = 34'h29957adbe;
      expv[14] = 34'h29957adbe;
      expv[15] = 34'h29957adbe;
      expv[16] = 34'h09957adbe;
      expv[17] = 34'h29957adbe;
      expv[18] = 34'h09957adbe;
      expv[19] = 34'h09957adbe;
      expv[20] = 34'h09957adbe;
      expv[21] = 34'h09957adbe;
      expv[22] = 34'h29957adbe;
      expv[23] = 34'h29957adbe;
      expv[24] = 34'h09957adbe;
      expv[25] = 34'h09957adbe;
      expv[26] = 34'h29957adbe;
      expv[27] = 34'h09957adbe;
      expv[28] = 34'h09957adbe;
      expv[29] = 34'h09957adbe;
      expv[30] = 34'h09957adbe;
      expv[31] = 34'h29957adbe;
      expv[32] = 34'h09957adbe;
      expv[33] = 34'h344d4d982;
      expv[34] = 34'h144d4d982;
      expv[35] = 34'h144d4d982;
      expv[36] = 34'h144d4d982;
      expv[37] = 34'h144d4d982;
      expv[38] = 34'h144d4d982;
      expv[39] = 34'h144d4d982;
      expv[40] = 34'h144d4d982;
      expv[41] = 34'h144d4d982;
      expv[42] = 34'h144d4d982;
      expv[43] = 34'h344d4d982;
      expv[44] = 34'h144d4d982;
      expv[45] = 34'h144d4d982;
      expv[46] = 34'h144d4d982;
      expv[47] = 34'h144d4d982;
      expv[48] = 34'h144d4d982;
      expv[49] = 34'h144d4d982;
      expv[50] = 34'h144d4d982;
      expv[51] = 34'h144d4d982;
      expv[52] = 34'h144d4d982;
      expv[53] = 34'h144d4d982;
      expv[54] = 34'h27c196cf4;
      expv[55] = 34'h07c196cf4;
      expv[56] = 34'h07c196cf4;
      expv[57] = 34'h07c196cf4;
      expv[58] = 34'h07c196cf4;
      expv[59] = 34'h07c196cf4;
      expv[60] = 34'h07c196cf4;
      expv[61] = 34'h07c196cf4;
      expv[62] = 34'h07c196cf4;
      expv[63] = 34'h07c196cf4;
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
