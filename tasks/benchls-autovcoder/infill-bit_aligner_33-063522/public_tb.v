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

  autovcoder_063522 dut (
    .clk(clk),
    .arst(in_vec[34:34]),
    .din(in_vec[33:2]),
    .din_valid(in_vec[1:1]),
    .din_slip(in_vec[0:0]),
    .dout(out_vec[33:1]),
    .dout_valid(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 35'h5c7432c28;
    stim[1] = 35'h69a4804fd;
    stim[2] = 35'h28a464600;
    stim[3] = 35'h0aae58833;
    stim[4] = 35'h3bb6cf174;
    stim[5] = 35'h2d546b4d2;
    stim[6] = 35'h29de17fcb;
    stim[7] = 35'h35efdfc1a;
    stim[8] = 35'h101a7871a;
    stim[9] = 35'h293ab9779;
    stim[10] = 35'h0c068f9e9;
    stim[11] = 35'h329960e7b;
    stim[12] = 35'h10f82bad8;
    stim[13] = 35'h33ee54eb0;
    stim[14] = 35'h0a20cef9e;
    stim[15] = 35'h327048378;
    stim[16] = 35'h3db6ea5b5;
    stim[17] = 35'h3783a6e9f;
    stim[18] = 35'h16eedf6e8;
    stim[19] = 35'h2f2c650fb;
    stim[20] = 35'h121b3f981;
    stim[21] = 35'h2dc5c9c7e;
    stim[22] = 35'h39cc08787;
    stim[23] = 35'h09fc53743;
    stim[24] = 35'h1f63ae71b;
    stim[25] = 35'h3dd905d93;
    stim[26] = 35'h145365e4b;
    stim[27] = 35'h299ff3fe8;
    stim[28] = 35'h0cb577c15;
    stim[29] = 35'h1fa768b8c;
    stim[30] = 35'h00fbf7a1c;
    stim[31] = 35'h3f0fd7aab;
    stim[32] = 35'h0152aa77a;
    stim[33] = 35'h18b9e53de;
    stim[34] = 35'h3e16d7f90;
    stim[35] = 35'h2d7b13afb;
    stim[36] = 35'h29d0702a4;
    stim[37] = 35'h1d971de78;
    stim[38] = 35'h34526dc46;
    stim[39] = 35'h1177dc979;
    stim[40] = 35'h34d9659e0;
    stim[41] = 35'h09ca26844;
    stim[42] = 35'h170c66561;
    stim[43] = 35'h0d163eccf;
    stim[44] = 35'h1e817c44a;
    stim[45] = 35'h2e6418cdf;
    stim[46] = 35'h08c6d637c;
    stim[47] = 35'h00966798a;
    stim[48] = 35'h5ab4e94b3;
    stim[49] = 35'h338ec7d60;
    stim[50] = 35'h570a70837;
    stim[51] = 35'h2ad0d2e64;
    stim[52] = 35'h16d223e83;
    stim[53] = 35'h1034f31e3;
    stim[54] = 35'h0b6217b2b;
    stim[55] = 35'h2b0028f0d;
    stim[56] = 35'h3269b26c7;
    stim[57] = 35'h284f85494;
    stim[58] = 35'h3fe827028;
    stim[59] = 35'h3c83ad63c;
    stim[60] = 35'h3df2cb6de;
    stim[61] = 35'h277e7ed2d;
    stim[62] = 35'h1c4ff5535;
    stim[63] = 35'h15fa50d29;
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
      expv[0] = 34'h000000000;
      expv[1] = 34'h000000000;
      expv[2] = 34'h000000000;
      expv[3] = 34'h000000000;
      expv[4] = 34'h02ab9620c;
      expv[5] = 34'h02ab9620c;
      expv[6] = 34'h000000001;
      expv[7] = 34'h0daa8d69b;
      expv[8] = 34'h0d4ef0bff;
      expv[9] = 34'h06d7bf7f1;
      expv[10] = 34'h06d7bf7f0;
      expv[11] = 34'h06d7bf7f0;
      expv[12] = 34'h27a034f0f;
      expv[13] = 34'h27a034f0e;
      expv[14] = 34'h27a034f0e;
      expv[15] = 34'h3cf94cb07;
      expv[16] = 34'h3cf94cb06;
      expv[17] = 34'h3cf94cb06;
      expv[18] = 34'h1d3a8833b;
      expv[19] = 34'h1d3a8833a;
      expv[20] = 34'h287f783a7;
      expv[21] = 34'h287f783a6;
      expv[22] = 34'h271fbcb19;
      expv[23] = 34'h08785b8b9;
      expv[24] = 34'h14dd1ce61;
      expv[25] = 34'h3ae7193f9;
      expv[26] = 34'h241764fb1;
      expv[27] = 34'h1365e4fbb;
      expv[28] = 34'h1365e4fba;
      expv[29] = 34'h1365e4fba;
      expv[30] = 34'h1365e4fba;
      expv[31] = 34'h1365e4fba;
      expv[32] = 34'h03f5eaaa3;
      expv[33] = 34'h2a554ef7f;
      expv[34] = 34'h0b9e53dc1;
      expv[35] = 34'h0b9e53dc0;
      expv[36] = 34'h35ec4ebed;
      expv[37] = 34'h35ec4ebec;
      expv[38] = 34'h35ec4ebec;
      expv[39] = 34'h28a4db88d;
      expv[40] = 34'h28a4db88c;
      expv[41] = 34'h28a4db88c;
      expv[42] = 34'h28a4db88c;
      expv[43] = 34'h28a4db88c;
      expv[44] = 34'h068b1f666;
      expv[45] = 34'h068b1f667;
      expv[46] = 34'h3fa05f113;
      expv[47] = 34'h3fa05f112;
      expv[48] = 34'h000000000;
      expv[49] = 34'h000000000;
      expv[50] = 34'h000000000;
      expv[51] = 34'h000000000;
      expv[52] = 34'h000000000;
      expv[53] = 34'h05b488fa0;
      expv[54] = 34'h000000001;
      expv[55] = 34'h15034f31f;
      expv[56] = 34'h15034f31e;
      expv[57] = 34'h18ad885ed;
      expv[58] = 34'h18ad885ec;
      expv[59] = 34'h18ad885ec;
      expv[60] = 34'h18ad885ec;
      expv[61] = 34'h2df269b27;
      expv[62] = 34'h2df269b26;
      expv[63] = 34'h2df269b26;
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
