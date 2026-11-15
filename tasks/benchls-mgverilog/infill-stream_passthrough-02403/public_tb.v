// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 21;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_02403 dut (
    .clk(clk),
    .reset_n(in_vec[20:20]),
    .in_valid(in_vec[19:19]),
    .in_data(in_vec[18:11]),
    .in_channel(in_vec[10:3]),
    .in_startofpacket(in_vec[2:2]),
    .in_endofpacket(in_vec[1:1]),
    .out_ready(in_vec[0:0]),
    .in_ready(out_vec[11:11]),
    .out_valid(out_vec[10:10]),
    .out_data(out_vec[9:2]),
    .out_startofpacket(out_vec[1:1]),
    .out_endofpacket(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 21'h0b213c;
    stim[1] = 21'h05875c;
    stim[2] = 21'h1245f3;
    stim[3] = 21'h177eef;
    stim[4] = 21'h17c79d;
    stim[5] = 21'h11ef5f;
    stim[6] = 21'h1b9538;
    stim[7] = 21'h1eabcb;
    stim[8] = 21'h15bd9e;
    stim[9] = 21'h1e68df;
    stim[10] = 21'h1a42c6;
    stim[11] = 21'h1b15c3;
    stim[12] = 21'h12ccdf;
    stim[13] = 21'h166a23;
    stim[14] = 21'h1ee43b;
    stim[15] = 21'h14e9af;
    stim[16] = 21'h1cdaaa;
    stim[17] = 21'h12dbe9;
    stim[18] = 21'h1a5d9a;
    stim[19] = 21'h10597e;
    stim[20] = 21'h141334;
    stim[21] = 21'h1dcd2f;
    stim[22] = 21'h0b37dd;
    stim[23] = 21'h1f891e;
    stim[24] = 21'h145eb0;
    stim[25] = 21'h1b692c;
    stim[26] = 21'h161457;
    stim[27] = 21'h1c7b2c;
    stim[28] = 21'h1a2957;
    stim[29] = 21'h121bfc;
    stim[30] = 21'h1d4554;
    stim[31] = 21'h1738ec;
    stim[32] = 21'h17a411;
    stim[33] = 21'h151c89;
    stim[34] = 21'h14237a;
    stim[35] = 21'h17a954;
    stim[36] = 21'h13c166;
    stim[37] = 21'h19066a;
    stim[38] = 21'h1e8655;
    stim[39] = 21'h141f74;
    stim[40] = 21'h1ddee3;
    stim[41] = 21'h16d8a4;
    stim[42] = 21'h1be313;
    stim[43] = 21'h16de1b;
    stim[44] = 21'h118c0b;
    stim[45] = 21'h12516a;
    stim[46] = 21'h1be53a;
    stim[47] = 21'h1bee49;
    stim[48] = 21'h14bc46;
    stim[49] = 21'h19d4f3;
    stim[50] = 21'h1f6492;
    stim[51] = 21'h1c14da;
    stim[52] = 21'h1a1a34;
    stim[53] = 21'h120a97;
    stim[54] = 21'h1cc552;
    stim[55] = 21'h171331;
    stim[56] = 21'h141853;
    stim[57] = 21'h172221;
    stim[58] = 21'h195c55;
    stim[59] = 21'h10ed6c;
    stim[60] = 21'h1e8f35;
    stim[61] = 21'h136cc1;
    stim[62] = 21'h131ecc;
    stim[63] = 21'h1ce439;
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
      expv[0] = 12'h192;
      expv[1] = 12'h2c2;
      expv[2] = 12'h921;
      expv[3] = 12'hbbf;
      expv[4] = 12'hbe2;
      expv[5] = 12'h8f7;
      expv[6] = 12'h1c8;
      expv[7] = 12'hb55;
      expv[8] = 12'h2df;
      expv[9] = 12'hb37;
      expv[10] = 12'h123;
      expv[11] = 12'h989;
      expv[12] = 12'h967;
      expv[13] = 12'hb35;
      expv[14] = 12'hb71;
      expv[15] = 12'ha77;
      expv[16] = 12'h26d;
      expv[17] = 12'h96c;
      expv[18] = 12'h12d;
      expv[19] = 12'h02f;
      expv[20] = 12'h20a;
      expv[21] = 12'hae7;
      expv[22] = 12'h99a;
      expv[23] = 12'h3c7;
      expv[24] = 12'h22c;
      expv[25] = 12'h1b6;
      expv[26] = 12'hb0b;
      expv[27] = 12'h23e;
      expv[28] = 12'h917;
      expv[29] = 12'h10e;
      expv[30] = 12'h2a2;
      expv[31] = 12'h39e;
      expv[32] = 12'hbd0;
      expv[33] = 12'ha8c;
      expv[34] = 12'h211;
      expv[35] = 12'h3d6;
      expv[36] = 12'h1e3;
      expv[37] = 12'h081;
      expv[38] = 12'hb42;
      expv[39] = 12'h20e;
      expv[40] = 12'haed;
      expv[41] = 12'h36e;
      expv[42] = 12'h9f1;
      expv[43] = 12'hb6d;
      expv[44] = 12'h8c5;
      expv[45] = 12'h129;
      expv[46] = 12'h1f1;
      expv[47] = 12'h9f4;
      expv[48] = 12'h25f;
      expv[49] = 12'h8e9;
      expv[50] = 12'h3b1;
      expv[51] = 12'h209;
      expv[52] = 12'h10e;
      expv[53] = 12'h907;
      expv[54] = 12'h261;
      expv[55] = 12'hb88;
      expv[56] = 12'ha0d;
      expv[57] = 12'hb90;
      expv[58] = 12'h8ae;
      expv[59] = 12'h076;
      expv[60] = 12'hb46;
      expv[61] = 12'h9b4;
      expv[62] = 12'h18e;
      expv[63] = 12'ha70;
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
