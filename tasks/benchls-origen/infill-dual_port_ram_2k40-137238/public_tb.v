// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 83;
  localparam OW = 40;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_137238 dut (
    .RCLK(clk),
    .RCLKE(in_vec[82:82]),
    .RE(in_vec[81:81]),
    .RADDR(in_vec[80:70]),
    .WCLK(in_vec[69:69]),
    .WCLKE(in_vec[68:68]),
    .WE(in_vec[67:67]),
    .WADDR(in_vec[66:56]),
    .MASK(in_vec[55:40]),
    .WDATA(in_vec[39:0]),
    .RDATA(out_vec[39:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 83'h6e0134512788422544919;
    stim[1] = 83'h43bdc774d7f306a7dc339;
    stim[2] = 83'h7d87ec5426c5f0abf3952;
    stim[3] = 83'h3f0f0001c57ad3b3badb1;
    stim[4] = 83'h3faad31b7c293875aad2a;
    stim[5] = 83'h1787f5e2f9426bbce1fee;
    stim[6] = 83'h5a3d7a8878006df9e2395;
    stim[7] = 83'h3c2d1120a1dd246216522;
    stim[8] = 83'h7a6339c49638e09245755;
    stim[9] = 83'h3bd095d882c20742ea55c;
    stim[10] = 83'h781b71f3ecdfe29eccc67;
    stim[11] = 83'h64518846af7f1319ec5d6;
    stim[12] = 83'h0cae64eebc108f3750f7d;
    stim[13] = 83'h70d9af479e021c0d78919;
    stim[14] = 83'h0d4887be22403dcbb6830;
    stim[15] = 83'h1c61369ba84a02512cf93;
    stim[16] = 83'h13e083368633ce30faec3;
    stim[17] = 83'h7ff9d350aef46758f424b;
    stim[18] = 83'h5d6a4359f7b005f486d82;
    stim[19] = 83'h2b99b00d5d8006a226e69;
    stim[20] = 83'h1077366898b87ddea8803;
    stim[21] = 83'h39f3842195fb223565994;
    stim[22] = 83'h56d2894896650b76fd00f;
    stim[23] = 83'h5d7b47a9f8f834879fdc4;
    stim[24] = 83'h6c0f09420fc353768a57f;
    stim[25] = 83'h5d86f69dace1e3219e312;
    stim[26] = 83'h1cb1c5d6d64913e40afb2;
    stim[27] = 83'h1d70038eae75d7cdcfd14;
    stim[28] = 83'h478c8190d27a5678d4c7c;
    stim[29] = 83'h661d303122edb9baa3904;
    stim[30] = 83'h7f21ece2d5c0376207e7c;
    stim[31] = 83'h1a382d857516481954d75;
    stim[32] = 83'h219d6d4775dd7130cdd0c;
    stim[33] = 83'h25a7d069cc3dc5492bb4c;
    stim[34] = 83'h2898161baa4f3b752801b;
    stim[35] = 83'h421b2ea9436b4795af19e;
    stim[36] = 83'h6314ea1211f45792465b0;
    stim[37] = 83'h40a1ca126596b24c09eea;
    stim[38] = 83'h77a0c16d2ce1ea35f86c0;
    stim[39] = 83'h69aaa441e745077bd97d0;
    stim[40] = 83'h0e549cafd249a6cf650ac;
    stim[41] = 83'h5559e6a9065947a9da5af;
    stim[42] = 83'h11e60da811d8daaf2cd0c;
    stim[43] = 83'h2cad9a6835285bed75f75;
    stim[44] = 83'h62c04b2183b994e752a9c;
    stim[45] = 83'h42d074ded0f8662978f74;
    stim[46] = 83'h65da37bc80e441e7f8f21;
    stim[47] = 83'h44f2d21ea43b648076a57;
    stim[48] = 83'h4b11a990f7130c7fb0291;
    stim[49] = 83'h65383e38ef104e42460d6;
    stim[50] = 83'h46f412de6a0f749ade475;
    stim[51] = 83'h3539a4b781be27d161e63;
    stim[52] = 83'h42f5fce510ce69334c920;
    stim[53] = 83'h47846b98f2844c492e4b4;
    stim[54] = 83'h463e3b9b7dec3a32894de;
    stim[55] = 83'h5e8ea1258a0030d7ea017;
    stim[56] = 83'h0cded0209d17b5330f1a4;
    stim[57] = 83'h23e84bc0c210d6298dc83;
    stim[58] = 83'h0d19c686a2a472f7fd0d7;
    stim[59] = 83'h42ec0cc840a8dcc3fd2e5;
    stim[60] = 83'h21e12cad507f83c243153;
    stim[61] = 83'h127fac072edc025f2df90;
    stim[62] = 83'h333bb4bb45453d8904ab2;
    stim[63] = 83'h5ea1e73df8536c39b8cb0;
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
      expv[0] = 40'hxxxxxxxxxx;
      expv[1] = 40'h0000000000;
      expv[2] = 40'h0000000000;
      expv[3] = 40'h0000000000;
      expv[4] = 40'h0000000000;
      expv[5] = 40'h0000000000;
      expv[6] = 40'h0000000000;
      expv[7] = 40'h0000000000;
      expv[8] = 40'h0000000000;
      expv[9] = 40'h0000000000;
      expv[10] = 40'h0000000000;
      expv[11] = 40'h0000000000;
      expv[12] = 40'h0000000000;
      expv[13] = 40'h0000000000;
      expv[14] = 40'h0000000000;
      expv[15] = 40'h0000000000;
      expv[16] = 40'h0000000000;
      expv[17] = 40'h0000000000;
      expv[18] = 40'h0000000000;
      expv[19] = 40'h0000000000;
      expv[20] = 40'h0000000000;
      expv[21] = 40'h0000000000;
      expv[22] = 40'h0000000000;
      expv[23] = 40'h0000000000;
      expv[24] = 40'h0000000000;
      expv[25] = 40'h0000000000;
      expv[26] = 40'h0000000000;
      expv[27] = 40'h0000000000;
      expv[28] = 40'h0000000000;
      expv[29] = 40'h0000000000;
      expv[30] = 40'h0000000000;
      expv[31] = 40'h0000000000;
      expv[32] = 40'h0000000000;
      expv[33] = 40'h0000000000;
      expv[34] = 40'h0000000000;
      expv[35] = 40'h0000000000;
      expv[36] = 40'h0000000000;
      expv[37] = 40'h0000000000;
      expv[38] = 40'h0000000000;
      expv[39] = 40'h0000000000;
      expv[40] = 40'h0000000000;
      expv[41] = 40'h0000000000;
      expv[42] = 40'h0000000000;
      expv[43] = 40'h0000000000;
      expv[44] = 40'h0000000000;
      expv[45] = 40'h0000000000;
      expv[46] = 40'h0000000000;
      expv[47] = 40'h0000000000;
      expv[48] = 40'h0000000000;
      expv[49] = 40'h0000000000;
      expv[50] = 40'h0000000000;
      expv[51] = 40'h0000000000;
      expv[52] = 40'h0000000000;
      expv[53] = 40'h0000000000;
      expv[54] = 40'h0000000000;
      expv[55] = 40'h0000000000;
      expv[56] = 40'h0000000000;
      expv[57] = 40'h0000000000;
      expv[58] = 40'h0000000000;
      expv[59] = 40'h0000000000;
      expv[60] = 40'h0000000000;
      expv[61] = 40'h0000000000;
      expv[62] = 40'h0000000000;
      expv[63] = 40'h0000000000;
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
