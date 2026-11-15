// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 33;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_125145 dut (
    .clk(clk),
    .reset(in_vec[32:32]),
    .instruction_in(in_vec[31:0]),
    .instruction_out(out_vec[32:1]),
    .stall(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 33'h16bc6e23f;
    stim[1] = 33'h10d54d9ce;
    stim[2] = 33'h04593a1ca;
    stim[3] = 33'h0cce6abf2;
    stim[4] = 33'h0abec56d2;
    stim[5] = 33'h02b1c2aa6;
    stim[6] = 33'h0d5f5e11a;
    stim[7] = 33'h08734cfb7;
    stim[8] = 33'h0e6120239;
    stim[9] = 33'h0b09b50f9;
    stim[10] = 33'h00ddd3681;
    stim[11] = 33'h08c848ad1;
    stim[12] = 33'h05592850b;
    stim[13] = 33'h0376067be;
    stim[14] = 33'h067ad940e;
    stim[15] = 33'h0568248e1;
    stim[16] = 33'h0214999b3;
    stim[17] = 33'h0c78ae69f;
    stim[18] = 33'h01bc355d6;
    stim[19] = 33'h003641b0e;
    stim[20] = 33'h054a21162;
    stim[21] = 33'h0b0a5dd2b;
    stim[22] = 33'h062175046;
    stim[23] = 33'h0e8134a06;
    stim[24] = 33'h07d64932b;
    stim[25] = 33'h076e0b7dd;
    stim[26] = 33'h0e04e0943;
    stim[27] = 33'h0bb22679f;
    stim[28] = 33'h0faf8d961;
    stim[29] = 33'h0aebebef5;
    stim[30] = 33'h0407f0fba;
    stim[31] = 33'h0ead87f37;
    stim[32] = 33'h08fb28aae;
    stim[33] = 33'h083058cf9;
    stim[34] = 33'h0966dfa40;
    stim[35] = 33'h0c0163354;
    stim[36] = 33'h017bdc0cb;
    stim[37] = 33'h0b238f09d;
    stim[38] = 33'h04c0dda12;
    stim[39] = 33'h06d8d4ca9;
    stim[40] = 33'h06d359086;
    stim[41] = 33'h0907f9e98;
    stim[42] = 33'h017570f7e;
    stim[43] = 33'h054c21ea3;
    stim[44] = 33'h0840173f5;
    stim[45] = 33'h0c6ed0f0d;
    stim[46] = 33'h0ab17ba6d;
    stim[47] = 33'h08333de2e;
    stim[48] = 33'h02cff8b16;
    stim[49] = 33'h0fdc5b402;
    stim[50] = 33'h0cc5ef2ec;
    stim[51] = 33'h008e9894a;
    stim[52] = 33'h1be6cc7f0;
    stim[53] = 33'h027f4abc5;
    stim[54] = 33'h0e30a8fe8;
    stim[55] = 33'h02dfb9882;
    stim[56] = 33'h074c69e86;
    stim[57] = 33'h0b380e9fb;
    stim[58] = 33'h0f9c539ca;
    stim[59] = 33'h0ae6feaf2;
    stim[60] = 33'h0f7a48c8d;
    stim[61] = 33'h00958dc41;
    stim[62] = 33'h0c0c3a1fc;
    stim[63] = 33'h05c6ae3ba;
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
      expv[0] = 33'h000000000;
      expv[1] = 33'h000000000;
      expv[2] = 33'h000000000;
      expv[3] = 33'h000000000;
      expv[4] = 33'h000000000;
      expv[5] = 33'h000000000;
      expv[6] = 33'h000000000;
      expv[7] = 33'h000000000;
      expv[8] = 33'h000000000;
      expv[9] = 33'h000000000;
      expv[10] = 33'h08b274394;
      expv[11] = 33'h08b274394;
      expv[12] = 33'h08b274394;
      expv[13] = 33'h08b274394;
      expv[14] = 33'h1abebc234;
      expv[15] = 33'h1abebc234;
      expv[16] = 33'h1abebc234;
      expv[17] = 33'h1abebc234;
      expv[18] = 33'h01bba6d02;
      expv[19] = 33'h01bba6d02;
      expv[20] = 33'h01bba6d02;
      expv[21] = 33'h01bba6d02;
      expv[22] = 33'h0cf5b281c;
      expv[23] = 33'h0cf5b281c;
      expv[24] = 33'h0cf5b281c;
      expv[25] = 33'h0cf5b281c;
      expv[26] = 33'h03786abac;
      expv[27] = 33'h03786abac;
      expv[28] = 33'h03786abac;
      expv[29] = 33'h03786abac;
      expv[30] = 33'h0c42ea08c;
      expv[31] = 33'h0c42ea08c;
      expv[32] = 33'h0c42ea08c;
      expv[33] = 33'h0c42ea08c;
      expv[34] = 33'h1c09c1286;
      expv[35] = 33'h1c09c1286;
      expv[36] = 33'h1c09c1286;
      expv[37] = 33'h1c09c1286;
      expv[38] = 33'h080fe1f74;
      expv[39] = 33'h080fe1f74;
      expv[40] = 33'h080fe1f74;
      expv[41] = 33'h080fe1f74;
      expv[42] = 33'h12cdbf480;
      expv[43] = 33'h12cdbf480;
      expv[44] = 33'h12cdbf480;
      expv[45] = 33'h12cdbf480;
      expv[46] = 33'h0981bb424;
      expv[47] = 33'h0981bb424;
      expv[48] = 33'h0981bb424;
      expv[49] = 33'h0981bb424;
      expv[50] = 33'h02eae1efc;
      expv[51] = 33'h02eae1efc;
      expv[52] = 33'h000000000;
      expv[53] = 33'h000000000;
      expv[54] = 33'h000000000;
      expv[55] = 33'h000000000;
      expv[56] = 33'h000000000;
      expv[57] = 33'h000000000;
      expv[58] = 33'h000000000;
      expv[59] = 33'h000000000;
      expv[60] = 33'h000000000;
      expv[61] = 33'h04fe9578a;
      expv[62] = 33'h04fe9578a;
      expv[63] = 33'h04fe9578a;
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
