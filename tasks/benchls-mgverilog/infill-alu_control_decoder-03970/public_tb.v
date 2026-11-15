// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 8;
  localparam OW = 3;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_03970 dut (
    .funct(in_vec[7:2]),
    .aluop(in_vec[1:0]),
    .alucontrol(out_vec[2:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 8'h0c;
    stim[1] = 8'hd0;
    stim[2] = 8'h34;
    stim[3] = 8'hfc;
    stim[4] = 8'h8f;
    stim[5] = 8'heb;
    stim[6] = 8'h57;
    stim[7] = 8'h6d;
    stim[8] = 8'hf2;
    stim[9] = 8'h30;
    stim[10] = 8'ha2;
    stim[11] = 8'h65;
    stim[12] = 8'h34;
    stim[13] = 8'h3f;
    stim[14] = 8'h98;
    stim[15] = 8'h20;
    stim[16] = 8'h59;
    stim[17] = 8'h18;
    stim[18] = 8'h0e;
    stim[19] = 8'h04;
    stim[20] = 8'had;
    stim[21] = 8'h39;
    stim[22] = 8'hf0;
    stim[23] = 8'h39;
    stim[24] = 8'h7e;
    stim[25] = 8'h88;
    stim[26] = 8'h26;
    stim[27] = 8'h73;
    stim[28] = 8'haa;
    stim[29] = 8'h04;
    stim[30] = 8'h30;
    stim[31] = 8'hb7;
    stim[32] = 8'hcf;
    stim[33] = 8'h06;
    stim[34] = 8'hc9;
    stim[35] = 8'h59;
    stim[36] = 8'h09;
    stim[37] = 8'hea;
    stim[38] = 8'hdc;
    stim[39] = 8'h58;
    stim[40] = 8'h30;
    stim[41] = 8'h9d;
    stim[42] = 8'h48;
    stim[43] = 8'hba;
    stim[44] = 8'h7d;
    stim[45] = 8'h9e;
    stim[46] = 8'hd7;
    stim[47] = 8'he2;
    stim[48] = 8'h31;
    stim[49] = 8'h9c;
    stim[50] = 8'h5c;
    stim[51] = 8'h92;
    stim[52] = 8'h0a;
    stim[53] = 8'hb4;
    stim[54] = 8'h63;
    stim[55] = 8'h91;
    stim[56] = 8'hbe;
    stim[57] = 8'h36;
    stim[58] = 8'h40;
    stim[59] = 8'h13;
    stim[60] = 8'hde;
    stim[61] = 8'h63;
    stim[62] = 8'hfe;
    stim[63] = 8'h58;
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
      expv[0] = 3'h2;
      expv[1] = 3'h2;
      expv[2] = 3'h2;
      expv[3] = 3'h2;
      expv[4] = 3'hx;
      expv[5] = 3'hx;
      expv[6] = 3'hx;
      expv[7] = 3'h6;
      expv[8] = 3'hx;
      expv[9] = 3'h2;
      expv[10] = 3'hx;
      expv[11] = 3'h6;
      expv[12] = 3'h2;
      expv[13] = 3'hx;
      expv[14] = 3'h2;
      expv[15] = 3'h2;
      expv[16] = 3'h6;
      expv[17] = 3'h2;
      expv[18] = 3'hx;
      expv[19] = 3'h2;
      expv[20] = 3'h6;
      expv[21] = 3'h6;
      expv[22] = 3'h2;
      expv[23] = 3'h6;
      expv[24] = 3'hx;
      expv[25] = 3'h2;
      expv[26] = 3'hx;
      expv[27] = 3'hx;
      expv[28] = 3'h7;
      expv[29] = 3'h2;
      expv[30] = 3'h2;
      expv[31] = 3'hx;
      expv[32] = 3'hx;
      expv[33] = 3'hx;
      expv[34] = 3'h6;
      expv[35] = 3'h6;
      expv[36] = 3'h6;
      expv[37] = 3'hx;
      expv[38] = 3'h2;
      expv[39] = 3'h2;
      expv[40] = 3'h2;
      expv[41] = 3'h6;
      expv[42] = 3'h2;
      expv[43] = 3'hx;
      expv[44] = 3'h6;
      expv[45] = 3'hx;
      expv[46] = 3'hx;
      expv[47] = 3'hx;
      expv[48] = 3'h6;
      expv[49] = 3'h2;
      expv[50] = 3'h2;
      expv[51] = 3'h0;
      expv[52] = 3'hx;
      expv[53] = 3'h2;
      expv[54] = 3'hx;
      expv[55] = 3'h6;
      expv[56] = 3'hx;
      expv[57] = 3'hx;
      expv[58] = 3'h2;
      expv[59] = 3'hx;
      expv[60] = 3'hx;
      expv[61] = 3'hx;
      expv[62] = 3'hx;
      expv[63] = 3'h2;
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
