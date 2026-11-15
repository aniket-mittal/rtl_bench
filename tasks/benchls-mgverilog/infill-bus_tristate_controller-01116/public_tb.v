// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 18;
  localparam OW = 18;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_01116 dut (
    .clk(clk),
    .rst_(in_vec[17:17]),
    .ena_(in_vec[16:16]),
    .r0_dout(in_vec[15:8]),
    .r1_dout(in_vec[7:0]),
    .rdy_(out_vec[17:17]),
    .mem_we_(out_vec[16:16]),
    .abus(out_vec[15:8]),
    .dbus(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 18'h21558;
    stim[1] = 18'h27e7d;
    stim[2] = 18'h3b275;
    stim[3] = 18'h09008;
    stim[4] = 18'h0d9fc;
    stim[5] = 18'h0a3b1;
    stim[6] = 18'h195fb;
    stim[7] = 18'h05127;
    stim[8] = 18'h05144;
    stim[9] = 18'h03571;
    stim[10] = 18'h1b259;
    stim[11] = 18'h19abb;
    stim[12] = 18'h0bbdd;
    stim[13] = 18'h06cb8;
    stim[14] = 18'h009f1;
    stim[15] = 18'h20a43;
    stim[16] = 18'h1d461;
    stim[17] = 18'h192ae;
    stim[18] = 18'h1c54f;
    stim[19] = 18'h139d9;
    stim[20] = 18'h0c95e;
    stim[21] = 18'h1c8cc;
    stim[22] = 18'h044e1;
    stim[23] = 18'h15007;
    stim[24] = 18'h16bdc;
    stim[25] = 18'h054d8;
    stim[26] = 18'h1aad2;
    stim[27] = 18'h1351c;
    stim[28] = 18'h06259;
    stim[29] = 18'h18cbd;
    stim[30] = 18'h1865f;
    stim[31] = 18'h020f8;
    stim[32] = 18'h11212;
    stim[33] = 18'h1493e;
    stim[34] = 18'h18e5e;
    stim[35] = 18'h1fb70;
    stim[36] = 18'h1c0c6;
    stim[37] = 18'h09c0b;
    stim[38] = 18'h0cc71;
    stim[39] = 18'h0b146;
    stim[40] = 18'h07485;
    stim[41] = 18'h18a54;
    stim[42] = 18'h02115;
    stim[43] = 18'h12a04;
    stim[44] = 18'h18a2a;
    stim[45] = 18'h06ef5;
    stim[46] = 18'h1cce1;
    stim[47] = 18'h0cdbf;
    stim[48] = 18'h00c24;
    stim[49] = 18'h0cf3e;
    stim[50] = 18'h1252d;
    stim[51] = 18'h18ee4;
    stim[52] = 18'h092de;
    stim[53] = 18'h00ba4;
    stim[54] = 18'h004c8;
    stim[55] = 18'h07499;
    stim[56] = 18'h18735;
    stim[57] = 18'h161e6;
    stim[58] = 18'h163eb;
    stim[59] = 18'h136ea;
    stim[60] = 18'h0d021;
    stim[61] = 18'h075b4;
    stim[62] = 18'h09138;
    stim[63] = 18'h1d888;
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
      expv[0] = 18'hxxxxx;
      expv[1] = 18'hx7d7e;
      expv[2] = 18'hx75b2;
      expv[3] = 18'hxxxxx;
      expv[4] = 18'hxxxxx;
      expv[5] = 18'hxxxxx;
      expv[6] = 18'hxxxxx;
      expv[7] = 18'hxxxxx;
      expv[8] = 18'hxxxxx;
      expv[9] = 18'hxxxxx;
      expv[10] = 18'hxxxxx;
      expv[11] = 18'hxxxxx;
      expv[12] = 18'hxxxxx;
      expv[13] = 18'hxxxxx;
      expv[14] = 18'hxxxxx;
      expv[15] = 18'hxxxxx;
      expv[16] = 18'hxxxxx;
      expv[17] = 18'hxxxxx;
      expv[18] = 18'hxxxxx;
      expv[19] = 18'hxxxxx;
      expv[20] = 18'hxxxxx;
      expv[21] = 18'hxxxxx;
      expv[22] = 18'hxxxxx;
      expv[23] = 18'hxxxxx;
      expv[24] = 18'hxxxxx;
      expv[25] = 18'hxxxxx;
      expv[26] = 18'hxxxxx;
      expv[27] = 18'hxxxxx;
      expv[28] = 18'hxxxxx;
      expv[29] = 18'hxxxxx;
      expv[30] = 18'hxxxxx;
      expv[31] = 18'hxxxxx;
      expv[32] = 18'hxxxxx;
      expv[33] = 18'hxxxxx;
      expv[34] = 18'hxxxxx;
      expv[35] = 18'hxxxxx;
      expv[36] = 18'hxxxxx;
      expv[37] = 18'hxxxxx;
      expv[38] = 18'hxxxxx;
      expv[39] = 18'hxxxxx;
      expv[40] = 18'hxxxxx;
      expv[41] = 18'hxxxxx;
      expv[42] = 18'hxxxxx;
      expv[43] = 18'hxxxxx;
      expv[44] = 18'hxxxxx;
      expv[45] = 18'hxxxxx;
      expv[46] = 18'hxxxxx;
      expv[47] = 18'hxxxxx;
      expv[48] = 18'hxxxxx;
      expv[49] = 18'hxxxxx;
      expv[50] = 18'hxxxxx;
      expv[51] = 18'hxxxxx;
      expv[52] = 18'hxxxxx;
      expv[53] = 18'hxxxxx;
      expv[54] = 18'hxxxxx;
      expv[55] = 18'hxxxxx;
      expv[56] = 18'hxxxxx;
      expv[57] = 18'hxxxxx;
      expv[58] = 18'hxxxxx;
      expv[59] = 18'hxxxxx;
      expv[60] = 18'hxxxxx;
      expv[61] = 18'hxxxxx;
      expv[62] = 18'hxxxxx;
      expv[63] = 18'hxxxxx;
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
