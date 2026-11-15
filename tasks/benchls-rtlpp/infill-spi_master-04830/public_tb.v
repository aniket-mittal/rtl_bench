// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 28;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_04830 dut (
    .clk(clk),
    .rst(in_vec[27:27]),
    .a(in_vec[26:11]),
    .din(in_vec[10:3]),
    .rd(in_vec[2:2]),
    .wr(in_vec[1:1]),
    .int_serial_ack(in_vec[0:0]),
    .dout(out_vec[8:1]),
    .int_serial_req(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 28'h9c4da84;
    stim[1] = 28'ha7a2f51;
    stim[2] = 28'h58213ac;
    stim[3] = 28'h0aa10d7;
    stim[4] = 28'h7f8e0df;
    stim[5] = 28'h5fe98dd;
    stim[6] = 28'h29a62d3;
    stim[7] = 28'h00e3c23;
    stim[8] = 28'h1e0398c;
    stim[9] = 28'h4eeffc2;
    stim[10] = 28'h630f66a;
    stim[11] = 28'h2e7689a;
    stim[12] = 28'h30a2019;
    stim[13] = 28'h398a9a7;
    stim[14] = 28'h06f9de0;
    stim[15] = 28'h751fe73;
    stim[16] = 28'h44b2a9d;
    stim[17] = 28'h28f150c;
    stim[18] = 28'h50dedb1;
    stim[19] = 28'h3d849b7;
    stim[20] = 28'h606d932;
    stim[21] = 28'h392923b;
    stim[22] = 28'h0919a6a;
    stim[23] = 28'h50a2055;
    stim[24] = 28'h102eae1;
    stim[25] = 28'h1fd299e;
    stim[26] = 28'h15526e8;
    stim[27] = 28'h5f1c9cb;
    stim[28] = 28'h5279925;
    stim[29] = 28'h315b846;
    stim[30] = 28'h396635f;
    stim[31] = 28'h552b0dd;
    stim[32] = 28'h413e096;
    stim[33] = 28'h5811b09;
    stim[34] = 28'h1d03014;
    stim[35] = 28'h6373b7c;
    stim[36] = 28'h3823e96;
    stim[37] = 28'h6ef6f0b;
    stim[38] = 28'h2bfbe36;
    stim[39] = 28'h1804c9a;
    stim[40] = 28'h39dab33;
    stim[41] = 28'h2956ea1;
    stim[42] = 28'h2620d90;
    stim[43] = 28'h6c58fe6;
    stim[44] = 28'he6c1dda;
    stim[45] = 28'h470ba96;
    stim[46] = 28'h174329f;
    stim[47] = 28'h5172fb6;
    stim[48] = 28'h00f18ae;
    stim[49] = 28'h290e18f;
    stim[50] = 28'h67ed671;
    stim[51] = 28'h0e6a4cb;
    stim[52] = 28'h4274748;
    stim[53] = 28'h3b5c4d9;
    stim[54] = 28'h39b3d48;
    stim[55] = 28'h7ee2075;
    stim[56] = 28'h0a68d32;
    stim[57] = 28'h7239468;
    stim[58] = 28'hf43f1b2;
    stim[59] = 28'h283066c;
    stim[60] = 28'h0c51ec2;
    stim[61] = 28'h0a99806;
    stim[62] = 28'h25f3fc1;
    stim[63] = 28'h209a28e;
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
      expv[0] = 9'h1fx;
      expv[1] = 9'h1fe;
      expv[2] = 9'h1fe;
      expv[3] = 9'h1fe;
      expv[4] = 9'h1fe;
      expv[5] = 9'h1fe;
      expv[6] = 9'h1fe;
      expv[7] = 9'h1fe;
      expv[8] = 9'h1fe;
      expv[9] = 9'h1fe;
      expv[10] = 9'h1fe;
      expv[11] = 9'h1fe;
      expv[12] = 9'h1fe;
      expv[13] = 9'h1fe;
      expv[14] = 9'h1fe;
      expv[15] = 9'h1fe;
      expv[16] = 9'h1fe;
      expv[17] = 9'h1fe;
      expv[18] = 9'h1fe;
      expv[19] = 9'h1fe;
      expv[20] = 9'h1fe;
      expv[21] = 9'h1fe;
      expv[22] = 9'h1fe;
      expv[23] = 9'h1fe;
      expv[24] = 9'h1fe;
      expv[25] = 9'h1fe;
      expv[26] = 9'h1fe;
      expv[27] = 9'h1fe;
      expv[28] = 9'h1fe;
      expv[29] = 9'h1fe;
      expv[30] = 9'h1fe;
      expv[31] = 9'h1fe;
      expv[32] = 9'h1fe;
      expv[33] = 9'h1fe;
      expv[34] = 9'h1fe;
      expv[35] = 9'h1fe;
      expv[36] = 9'h1fe;
      expv[37] = 9'h1fe;
      expv[38] = 9'h1fe;
      expv[39] = 9'h1fe;
      expv[40] = 9'h1fe;
      expv[41] = 9'h1fe;
      expv[42] = 9'h1fe;
      expv[43] = 9'h1fe;
      expv[44] = 9'h1fe;
      expv[45] = 9'h1fe;
      expv[46] = 9'h1fe;
      expv[47] = 9'h1fe;
      expv[48] = 9'h1fe;
      expv[49] = 9'h1fe;
      expv[50] = 9'h1fe;
      expv[51] = 9'h1fe;
      expv[52] = 9'h1fe;
      expv[53] = 9'h1fe;
      expv[54] = 9'h1fe;
      expv[55] = 9'h1fe;
      expv[56] = 9'h1fe;
      expv[57] = 9'h1fe;
      expv[58] = 9'h1fe;
      expv[59] = 9'h1fe;
      expv[60] = 9'h1fe;
      expv[61] = 9'h1fe;
      expv[62] = 9'h1fe;
      expv[63] = 9'h1fe;
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
