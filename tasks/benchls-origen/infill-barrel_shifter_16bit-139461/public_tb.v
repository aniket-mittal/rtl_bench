// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 21;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_139461 dut (
    .data_in(in_vec[20:5]),
    .shift_amount(in_vec[4:1]),
    .shift_direction(in_vec[0:0]),
    .data_out(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 21'h150c80;
    stim[1] = 21'h180305;
    stim[2] = 21'h026437;
    stim[3] = 21'h0abf69;
    stim[4] = 21'h0efd7e;
    stim[5] = 21'h09797b;
    stim[6] = 21'h14fd80;
    stim[7] = 21'h11c519;
    stim[8] = 21'h015c05;
    stim[9] = 21'h074803;
    stim[10] = 21'h12ebbb;
    stim[11] = 21'h03580c;
    stim[12] = 21'h161dbc;
    stim[13] = 21'h1b47ae;
    stim[14] = 21'h0786a6;
    stim[15] = 21'h025391;
    stim[16] = 21'h056112;
    stim[17] = 21'h0c18b0;
    stim[18] = 21'h0a269d;
    stim[19] = 21'h0c742b;
    stim[20] = 21'h1de87b;
    stim[21] = 21'h0a1b7c;
    stim[22] = 21'h1f3d85;
    stim[23] = 21'h11ea6a;
    stim[24] = 21'h12e6a5;
    stim[25] = 21'h13ec42;
    stim[26] = 21'h1361cf;
    stim[27] = 21'h13889f;
    stim[28] = 21'h0227e5;
    stim[29] = 21'h02f5c6;
    stim[30] = 21'h1741bc;
    stim[31] = 21'h118ec6;
    stim[32] = 21'h0bc09f;
    stim[33] = 21'h139abe;
    stim[34] = 21'h0e4d9e;
    stim[35] = 21'h017079;
    stim[36] = 21'h0a1de5;
    stim[37] = 21'h08fde3;
    stim[38] = 21'h0e6d6a;
    stim[39] = 21'h05f123;
    stim[40] = 21'h165bff;
    stim[41] = 21'h046f82;
    stim[42] = 21'h1c0a85;
    stim[43] = 21'h04b202;
    stim[44] = 21'h168f21;
    stim[45] = 21'h1aa0c5;
    stim[46] = 21'h065cd0;
    stim[47] = 21'h089140;
    stim[48] = 21'h0baf93;
    stim[49] = 21'h0d5944;
    stim[50] = 21'h18e1eb;
    stim[51] = 21'h15134a;
    stim[52] = 21'h027cfd;
    stim[53] = 21'h0241fa;
    stim[54] = 21'h08e9cc;
    stim[55] = 21'h0d2fae;
    stim[56] = 21'h1247f5;
    stim[57] = 21'h1e9f2a;
    stim[58] = 21'h151587;
    stim[59] = 21'h07d366;
    stim[60] = 21'h04d7f8;
    stim[61] = 21'h08b774;
    stim[62] = 21'h1de8a8;
    stim[63] = 21'h030365;
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
      expv[0] = 16'ha864;
      expv[1] = 16'h3006;
      expv[2] = 16'h0002;
      expv[3] = 16'h055f;
      expv[4] = 16'h8000;
      expv[5] = 16'h0002;
      expv[6] = 16'ha7ec;
      expv[7] = 16'h0008;
      expv[8] = 16'h02b8;
      expv[9] = 16'h1d20;
      expv[10] = 16'h0004;
      expv[11] = 16'hb000;
      expv[12] = 16'h4000;
      expv[13] = 16'h1e80;
      expv[14] = 16'he1a8;
      expv[15] = 16'h0012;
      expv[16] = 16'h1000;
      expv[17] = 16'hc500;
      expv[18] = 16'h0001;
      expv[19] = 16'h031d;
      expv[20] = 16'h0007;
      expv[21] = 16'hc000;
      expv[22] = 16'h3e7b;
      expv[23] = 16'hea60;
      expv[24] = 16'h25cd;
      expv[25] = 16'h3ec4;
      expv[26] = 16'h0136;
      expv[27] = 16'h0001;
      expv[28] = 16'h044f;
      expv[29] = 16'hbd70;
      expv[30] = 16'h4000;
      expv[31] = 16'h63b0;
      expv[32] = 16'h0000;
      expv[33] = 16'h8000;
      expv[34] = 16'h0000;
      expv[35] = 16'h0000;
      expv[36] = 16'h143b;
      expv[37] = 16'h23f7;
      expv[38] = 16'h6d60;
      expv[39] = 16'h17c4;
      expv[40] = 16'h0001;
      expv[41] = 16'h46f8;
      expv[42] = 16'h3815;
      expv[43] = 16'h4b20;
      expv[44] = 16'hb479;
      expv[45] = 16'h3541;
      expv[46] = 16'he600;
      expv[47] = 16'h448a;
      expv[48] = 16'h002e;
      expv[49] = 16'hab28;
      expv[50] = 16'h0638;
      expv[51] = 16'h1340;
      expv[52] = 16'h0000;
      expv[53] = 16'he000;
      expv[54] = 16'hd380;
      expv[55] = 16'hbe80;
      expv[56] = 16'h0024;
      expv[57] = 16'h9f20;
      expv[58] = 16'h1515;
      expv[59] = 16'hf4d8;
      expv[60] = 16'hf000;
      expv[61] = 16'hec00;
      expv[62] = 16'hf450;
      expv[63] = 16'h0606;
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
