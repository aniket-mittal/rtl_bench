// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 33;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_02333 dut (
    .clk(clk),
    .new_data(in_vec[32:32]),
    .in_l_re(in_vec[31:24]),
    .in_l_im(in_vec[23:16]),
    .in_r_re(in_vec[15:8]),
    .in_r_im(in_vec[7:0]),
    .corr_out(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 33'h154293e1b;
    stim[1] = 33'h0fd6920c5;
    stim[2] = 33'h035ff2ed4;
    stim[3] = 33'h032bcd8cf;
    stim[4] = 33'h087ccfe3a;
    stim[5] = 33'h0d52a4442;
    stim[6] = 33'h0ef0511d5;
    stim[7] = 33'h0885f2484;
    stim[8] = 33'h03fa3582c;
    stim[9] = 33'h04e061340;
    stim[10] = 33'h0ab3a4609;
    stim[11] = 33'h0227f6b60;
    stim[12] = 33'h0b60497ad;
    stim[13] = 33'h15d7dbb0f;
    stim[14] = 33'h1e7d7ab71;
    stim[15] = 33'h08fd67ba0;
    stim[16] = 33'h0082df986;
    stim[17] = 33'h00ff3a987;
    stim[18] = 33'h08e487114;
    stim[19] = 33'h147350936;
    stim[20] = 33'h03e6461b1;
    stim[21] = 33'h199088a5e;
    stim[22] = 33'h049109bcd;
    stim[23] = 33'h1d431ceff;
    stim[24] = 33'h1761ca272;
    stim[25] = 33'h140d5c4c1;
    stim[26] = 33'h0a972b8e4;
    stim[27] = 33'h1de3195a4;
    stim[28] = 33'h1c7606047;
    stim[29] = 33'h004f21749;
    stim[30] = 33'h165f11fc5;
    stim[31] = 33'h01321cf63;
    stim[32] = 33'h19e4f811e;
    stim[33] = 33'h1327a4063;
    stim[34] = 33'h186d64dfc;
    stim[35] = 33'h19c5e486b;
    stim[36] = 33'h156717a38;
    stim[37] = 33'h0bedb72f6;
    stim[38] = 33'h1ca6ac1f1;
    stim[39] = 33'h00f3bd3d4;
    stim[40] = 33'h1990d9365;
    stim[41] = 33'h0589ef92a;
    stim[42] = 33'h099a8fb99;
    stim[43] = 33'h15785fec9;
    stim[44] = 33'h082ea45da;
    stim[45] = 33'h12235b4b3;
    stim[46] = 33'h03b6dbf6d;
    stim[47] = 33'h0a263e701;
    stim[48] = 33'h00f718110;
    stim[49] = 33'h0265a39e2;
    stim[50] = 33'h07be3c124;
    stim[51] = 33'h0d04831e0;
    stim[52] = 33'h01d2e6d32;
    stim[53] = 33'h1d157b89a;
    stim[54] = 33'h1c343148f;
    stim[55] = 33'h1883612e5;
    stim[56] = 33'h0d9f8b4df;
    stim[57] = 33'h1c7569fb4;
    stim[58] = 33'h026749217;
    stim[59] = 33'h10e4e5e48;
    stim[60] = 33'h00cf47486;
    stim[61] = 33'h0072daea2;
    stim[62] = 33'h08f41a156;
    stim[63] = 33'h1a9c117d2;
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
      expv[0] = 16'hxxxx;
      expv[1] = 16'hxxxx;
      expv[2] = 16'hxxxx;
      expv[3] = 16'hxxxx;
      expv[4] = 16'hxxxx;
      expv[5] = 16'hxxxx;
      expv[6] = 16'hxxxx;
      expv[7] = 16'hxxxx;
      expv[8] = 16'hxxxx;
      expv[9] = 16'hxxxx;
      expv[10] = 16'hxxxx;
      expv[11] = 16'hxxxx;
      expv[12] = 16'hxxxx;
      expv[13] = 16'hxxxx;
      expv[14] = 16'h3dd6;
      expv[15] = 16'h6e0e;
      expv[16] = 16'h6e0e;
      expv[17] = 16'h6e0e;
      expv[18] = 16'h6e0e;
      expv[19] = 16'h6e0e;
      expv[20] = 16'h8a0c;
      expv[21] = 16'h8a0c;
      expv[22] = 16'h0dad;
      expv[23] = 16'h0dad;
      expv[24] = 16'h556a;
      expv[25] = 16'h3903;
      expv[26] = 16'hdb67;
      expv[27] = 16'hdb67;
      expv[28] = 16'hd195;
      expv[29] = 16'hdf00;
      expv[30] = 16'hdf00;
      expv[31] = 16'h6540;
      expv[32] = 16'h6540;
      expv[33] = 16'hc5b0;
      expv[34] = 16'h1c20;
      expv[35] = 16'h58e0;
      expv[36] = 16'h3bae;
      expv[37] = 16'hfaf6;
      expv[38] = 16'hfaf6;
      expv[39] = 16'h41b4;
      expv[40] = 16'h41b4;
      expv[41] = 16'hfc14;
      expv[42] = 16'hfc14;
      expv[43] = 16'hfc14;
      expv[44] = 16'h6f84;
      expv[45] = 16'h6f84;
      expv[46] = 16'hbebf;
      expv[47] = 16'hbebf;
      expv[48] = 16'hbebf;
      expv[49] = 16'hbebf;
      expv[50] = 16'hbebf;
      expv[51] = 16'hbebf;
      expv[52] = 16'hbebf;
      expv[53] = 16'hbebf;
      expv[54] = 16'h66d0;
      expv[55] = 16'h1555;
      expv[56] = 16'hca8e;
      expv[57] = 16'hca8e;
      expv[58] = 16'h39de;
      expv[59] = 16'h39de;
      expv[60] = 16'hb811;
      expv[61] = 16'hb811;
      expv[62] = 16'hb811;
      expv[63] = 16'hb811;
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
