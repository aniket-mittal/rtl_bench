// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  fec_rot_25 dut (
    .c(in_vec[31:0]),
    .co(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'h1098fba8;
    stim[1] = 32'hd2f46a27;
    stim[2] = 32'h29e31cfa;
    stim[3] = 32'h8b344ad5;
    stim[4] = 32'h258ad89a;
    stim[5] = 32'h40ed883f;
    stim[6] = 32'hd88eb74d;
    stim[7] = 32'h4e066db2;
    stim[8] = 32'h4d23ed62;
    stim[9] = 32'hd1a10a54;
    stim[10] = 32'h9c874a24;
    stim[11] = 32'h54dd77b2;
    stim[12] = 32'h29b94210;
    stim[13] = 32'hde28f8ae;
    stim[14] = 32'h836817ac;
    stim[15] = 32'h7cad0152;
    stim[16] = 32'h4b7a9b40;
    stim[17] = 32'h2283fa6a;
    stim[18] = 32'hc278016e;
    stim[19] = 32'h60dc1f7d;
    stim[20] = 32'hfb66c8d7;
    stim[21] = 32'hf943103c;
    stim[22] = 32'h3ffbbebb;
    stim[23] = 32'h622bbe05;
    stim[24] = 32'h12a59abc;
    stim[25] = 32'h7f02d299;
    stim[26] = 32'hfda6b8fa;
    stim[27] = 32'hf09d5496;
    stim[28] = 32'hcd8e767a;
    stim[29] = 32'h20305a66;
    stim[30] = 32'h95b98cb2;
    stim[31] = 32'hb1e4381e;
    stim[32] = 32'hcb1b6018;
    stim[33] = 32'h63d0d1b1;
    stim[34] = 32'hc5befa68;
    stim[35] = 32'h954536ac;
    stim[36] = 32'ha440ac36;
    stim[37] = 32'h71acc275;
    stim[38] = 32'he6579c95;
    stim[39] = 32'h0899565b;
    stim[40] = 32'hf7102f80;
    stim[41] = 32'h394d7f60;
    stim[42] = 32'hcbc8a202;
    stim[43] = 32'hbc1284a0;
    stim[44] = 32'h95698ef1;
    stim[45] = 32'hc13fc716;
    stim[46] = 32'h6227f5e0;
    stim[47] = 32'h20b52589;
    stim[48] = 32'h0a3064ad;
    stim[49] = 32'hf7ce4635;
    stim[50] = 32'h50db38d6;
    stim[51] = 32'h197bb160;
    stim[52] = 32'h972633f9;
    stim[53] = 32'hd24bc388;
    stim[54] = 32'h666eb3d7;
    stim[55] = 32'h03ad9349;
    stim[56] = 32'hc978ece0;
    stim[57] = 32'h82b0e6b5;
    stim[58] = 32'haaffdb1b;
    stim[59] = 32'h8a94b026;
    stim[60] = 32'h2aa954b9;
    stim[61] = 32'hcdbd8daf;
    stim[62] = 32'h3963cde4;
    stim[63] = 32'hd5d9aec0;
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
      expv[0] = 32'h518fb040;
      expv[1] = 32'hc126cd03;
      expv[2] = 32'h0611db61;
      expv[3] = 32'haf64edb1;
      expv[4] = 32'he1ad9c68;
      expv[5] = 32'hfcd8a460;
      expv[6] = 32'hb46b1d34;
      expv[7] = 32'h1546fc89;
      expv[8] = 32'hec9ef7d5;
      expv[9] = 32'h9ad0c946;
      expv[10] = 32'h96d4e8b5;
      expv[11] = 32'hd8d75788;
      expv[12] = 32'h31143454;
      expv[13] = 32'ha3efe0eb;
      expv[14] = 32'hfc813c90;
      expv[15] = 32'h86102f46;
      expv[16] = 32'hf9099675;
      expv[17] = 32'ha61fb2d1;
      expv[18] = 32'hede070b3;
      expv[19] = 32'h9bc1c360;
      expv[20] = 32'h3e8cf137;
      expv[21] = 32'h67517c5b;
      expv[22] = 32'hd79bf2f1;
      expv[23] = 32'h611bd24d;
      expv[24] = 32'h6cf9a1f5;
      expv[25] = 32'hc7ad102c;
      expv[26] = 32'h336bf0e8;
      expv[27] = 32'hd83537ef;
      expv[28] = 32'h57c703d9;
      expv[29] = 32'h91e5b2f7;
      expv[30] = 32'h8a3885ad;
      expv[31] = 32'h48a3db57;
      expv[32] = 32'hd6f662ba;
      expv[33] = 32'h50ed287f;
      expv[34] = 32'h04cfc479;
      expv[35] = 32'h549322c6;
      expv[36] = 32'h882a9501;
      expv[37] = 32'h40ac1d83;
      expv[38] = 32'h1fd9ba85;
      expv[39] = 32'h36f5604b;
      expv[40] = 32'h52028118;
      expv[41] = 32'h1417ea06;
      expv[42] = 32'hb22a4055;
      expv[43] = 32'h6f481773;
      expv[44] = 32'h6d38a6cd;
      expv[45] = 32'ha77c14c4;
      expv[46] = 32'hf4df68b5;
      expv[47] = 32'h215249c0;
      expv[48] = 32'hcf0649b0;
      expv[49] = 32'hafa41dca;
      expv[50] = 32'hae53a07f;
      expv[51] = 32'h7bfb1962;
      expv[52] = 32'h3ea375f6;
      expv[53] = 32'h8d3c55cc;
      expv[54] = 32'hce6b0834;
      expv[55] = 32'h947931e5;
      expv[56] = 32'h4d2ea8d5;
      expv[57] = 32'hfc8e2dec;
      expv[58] = 32'hba7de11c;
      expv[59] = 32'h4a4b4578;
      expv[60] = 32'hd115584c;
      expv[61] = 32'he3f8bb31;
      expv[62] = 32'h16fcc246;
      expv[63] = 32'h667a85df;
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
