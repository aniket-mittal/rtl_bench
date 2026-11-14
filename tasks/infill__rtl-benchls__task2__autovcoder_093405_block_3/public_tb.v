// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 35;
  localparam OW = 34;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_093405 dut (
    .ap_clk(clk),
    .ap_rst(in_vec[34:34]),
    .in_V_dout(in_vec[33:2]),
    .in_V_empty_n(in_vec[1:1]),
    .out_V_full_n(in_vec[0:0]),
    .in_V_read(out_vec[33:33]),
    .out_V_din(out_vec[32:1]),
    .out_V_write(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 35'h650af8ebc;
    stim[1] = 35'h71c4db82d;
    stim[2] = 35'h248a457a0;
    stim[3] = 35'h0a0610def;
    stim[4] = 35'h19e14cc80;
    stim[5] = 35'h3f8ca7dd6;
    stim[6] = 35'h19e29a50c;
    stim[7] = 35'h043e53756;
    stim[8] = 35'h2c2871f17;
    stim[9] = 35'h16f621f4a;
    stim[10] = 35'h220fa9d50;
    stim[11] = 35'h2b664dbaa;
    stim[12] = 35'h13845afaa;
    stim[13] = 35'h08214008a;
    stim[14] = 35'h2d87c1e33;
    stim[15] = 35'h0d0a68685;
    stim[16] = 35'h3c30c4adc;
    stim[17] = 35'h23326821f;
    stim[18] = 35'h3669df10e;
    stim[19] = 35'h293a547f2;
    stim[20] = 35'h15d20e98a;
    stim[21] = 35'h0891f1428;
    stim[22] = 35'h3a26943ea;
    stim[23] = 35'h19ebbc489;
    stim[24] = 35'h18878233f;
    stim[25] = 35'h34a76d727;
    stim[26] = 35'h050f6d135;
    stim[27] = 35'h2d7537b7d;
    stim[28] = 35'h1dbdee07a;
    stim[29] = 35'h3c7cbaf5e;
    stim[30] = 35'h21481df61;
    stim[31] = 35'h033b9c35f;
    stim[32] = 35'h0375d6b74;
    stim[33] = 35'h3740d140d;
    stim[34] = 35'h1ff57c891;
    stim[35] = 35'h3974b53ab;
    stim[36] = 35'h2f4599056;
    stim[37] = 35'h1c76896c0;
    stim[38] = 35'h2debdefca;
    stim[39] = 35'h2be098c1b;
    stim[40] = 35'h236168307;
    stim[41] = 35'h2d80f9383;
    stim[42] = 35'h21f29c971;
    stim[43] = 35'h136672592;
    stim[44] = 35'h3eddc6d4d;
    stim[45] = 35'h0ce0d2376;
    stim[46] = 35'h16285dab2;
    stim[47] = 35'h1c8f2861b;
    stim[48] = 35'h0d225ebd9;
    stim[49] = 35'h059e93007;
    stim[50] = 35'h0b12a3ae3;
    stim[51] = 35'h1c16029d7;
    stim[52] = 35'h1ec740049;
    stim[53] = 35'h3eb853bd9;
    stim[54] = 35'h1a4c5abce;
    stim[55] = 35'h3ffaf55d0;
    stim[56] = 35'h3d7c476af;
    stim[57] = 35'h34b20c257;
    stim[58] = 35'h24e921641;
    stim[59] = 35'h25ed122ae;
    stim[60] = 35'h37e1980e2;
    stim[61] = 35'h3e8bc8fb9;
    stim[62] = 35'h3cd301568;
    stim[63] = 35'h357ccb281;
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
      expv[0] = 34'h050af8ebe;
      expv[1] = 34'h11c4db82e;
      expv[2] = 34'h048a457a2;
      expv[3] = 34'h2a0610def;
      expv[4] = 34'h19e14cc82;
      expv[5] = 34'h1f8ca7dd6;
      expv[6] = 34'h19e29a50e;
      expv[7] = 34'h043e53756;
      expv[8] = 34'h2c2871f17;
      expv[9] = 34'h16f621f4a;
      expv[10] = 34'h020fa9d52;
      expv[11] = 34'h0b664dbaa;
      expv[12] = 34'h13845afaa;
      expv[13] = 34'h08214008a;
      expv[14] = 34'h2d87c1e33;
      expv[15] = 34'h0d0a68686;
      expv[16] = 34'h1c30c4ade;
      expv[17] = 34'h23326821f;
      expv[18] = 34'h1669df10e;
      expv[19] = 34'h093a547f2;
      expv[20] = 34'h15d20e98a;
      expv[21] = 34'h0891f142a;
      expv[22] = 34'h1a26943ea;
      expv[23] = 34'h19ebbc48a;
      expv[24] = 34'h38878233f;
      expv[25] = 34'h14a76d726;
      expv[26] = 34'h050f6d136;
      expv[27] = 34'h0d7537b7e;
      expv[28] = 34'h1dbdee07a;
      expv[29] = 34'h1c7cbaf5e;
      expv[30] = 34'h01481df62;
      expv[31] = 34'h233b9c35f;
      expv[32] = 34'h0375d6b76;
      expv[33] = 34'h1740d140e;
      expv[34] = 34'h1ff57c892;
      expv[35] = 34'h3974b53ab;
      expv[36] = 34'h0f4599056;
      expv[37] = 34'h1c76896c2;
      expv[38] = 34'h0debdefca;
      expv[39] = 34'h2be098c1b;
      expv[40] = 34'h236168307;
      expv[41] = 34'h2d80f9383;
      expv[42] = 34'h01f29c972;
      expv[43] = 34'h136672592;
      expv[44] = 34'h1eddc6d4e;
      expv[45] = 34'h0ce0d2376;
      expv[46] = 34'h16285dab2;
      expv[47] = 34'h3c8f2861b;
      expv[48] = 34'h0d225ebda;
      expv[49] = 34'h259e93007;
      expv[50] = 34'h2b12a3ae3;
      expv[51] = 34'h3c16029d7;
      expv[52] = 34'h1ec74004a;
      expv[53] = 34'h1eb853bda;
      expv[54] = 34'h1a4c5abce;
      expv[55] = 34'h1ffaf55d2;
      expv[56] = 34'h3d7c476af;
      expv[57] = 34'h14b20c256;
      expv[58] = 34'h04e921642;
      expv[59] = 34'h05ed122ae;
      expv[60] = 34'h17e1980e2;
      expv[61] = 34'h1e8bc8fba;
      expv[62] = 34'h1cd30156a;
      expv[63] = 34'h157ccb282;
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
