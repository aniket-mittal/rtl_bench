// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  fec_rot_13 dut (
    .c(in_vec[31:0]),
    .co(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'h7f862e96;
    stim[1] = 32'habf9eecb;
    stim[2] = 32'hda09a14d;
    stim[3] = 32'h06ba6385;
    stim[4] = 32'h3609cc62;
    stim[5] = 32'h2fe49445;
    stim[6] = 32'h8996726f;
    stim[7] = 32'h2f3a8df5;
    stim[8] = 32'hf1424d54;
    stim[9] = 32'h41e744e2;
    stim[10] = 32'h8876ac63;
    stim[11] = 32'hcca3bacd;
    stim[12] = 32'hefaf0fde;
    stim[13] = 32'hb45d3f2a;
    stim[14] = 32'h817344ff;
    stim[15] = 32'haf3189ca;
    stim[16] = 32'hc849b023;
    stim[17] = 32'hf9620840;
    stim[18] = 32'hc402eba0;
    stim[19] = 32'h637cfa4c;
    stim[20] = 32'h5181f48a;
    stim[21] = 32'h2e1d7bad;
    stim[22] = 32'hb43b1cfe;
    stim[23] = 32'h2aa57e3b;
    stim[24] = 32'h85b02c0b;
    stim[25] = 32'h643e4bcf;
    stim[26] = 32'h236b23ec;
    stim[27] = 32'hc7d7b6b3;
    stim[28] = 32'h267dc8ec;
    stim[29] = 32'hb9e5edb6;
    stim[30] = 32'h05c716c4;
    stim[31] = 32'h85cd9cb3;
    stim[32] = 32'hdfd14e69;
    stim[33] = 32'heb5a2a0f;
    stim[34] = 32'h06bc5801;
    stim[35] = 32'h638ff4b4;
    stim[36] = 32'hc9f23821;
    stim[37] = 32'h356ee0ca;
    stim[38] = 32'h7cf55a81;
    stim[39] = 32'h28021fba;
    stim[40] = 32'hde8e2d7a;
    stim[41] = 32'he32a2f83;
    stim[42] = 32'h312e3289;
    stim[43] = 32'h57e84647;
    stim[44] = 32'h4907499d;
    stim[45] = 32'h3f2aa727;
    stim[46] = 32'h3d6ca6d8;
    stim[47] = 32'hddcdf2b8;
    stim[48] = 32'h01d59df3;
    stim[49] = 32'h5ce506e6;
    stim[50] = 32'h6036dbb4;
    stim[51] = 32'h13ac4f49;
    stim[52] = 32'hba965306;
    stim[53] = 32'h37576713;
    stim[54] = 32'hc29b757b;
    stim[55] = 32'h534feca2;
    stim[56] = 32'hc6008233;
    stim[57] = 32'h9c17fc86;
    stim[58] = 32'haad2572e;
    stim[59] = 32'hec4a925a;
    stim[60] = 32'h4967cd75;
    stim[61] = 32'hc9e61e40;
    stim[62] = 32'h34fba681;
    stim[63] = 32'hd38d04f4;
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
      expv[0] = 32'hc06d402e;
      expv[1] = 32'h281298ab;
      expv[2] = 32'hfa93ae73;
      expv[3] = 32'h3d161b8b;
      expv[4] = 32'h80fa4dca;
      expv[5] = 32'hd2674206;
      expv[6] = 32'h75c475d8;
      expv[7] = 32'h1fb19a71;
      expv[8] = 32'h9fdbc6b4;
      expv[9] = 32'hf37da0dd;
      expv[10] = 32'h77841514;
      expv[11] = 32'h897507f7;
      expv[12] = 32'ha2146a18;
      expv[13] = 32'h36111c8a;
      expv[14] = 32'h7e9e90b4;
      expv[15] = 32'h7b567256;
      expv[16] = 32'h950c2d1e;
      expv[17] = 32'h35f163a0;
      expv[18] = 32'h0bd002b3;
      expv[19] = 32'h262afdc8;
      expv[20] = 32'h6240c2e4;
      expv[21] = 32'hf7fbbac5;
      expv[22] = 32'hf5ebfcb6;
      expv[23] = 32'hae2dc00e;
      expv[24] = 32'h4c84d24c;
      expv[25] = 32'h191dde80;
      expv[26] = 32'hde3eedd3;
      expv[27] = 32'h9231b321;
      expv[28] = 32'h461bfff9;
      expv[29] = 32'hc12f23e1;
      expv[30] = 32'ha9dd4258;
      expv[31] = 32'hfcf3aa7f;
      expv[32] = 32'had92f424;
      expv[33] = 32'h5a6ab8fe;
      expv[34] = 32'hfa669b8b;
      expv[35] = 32'h4b350dae;
      expv[36] = 32'hf96dd5f5;
      expv[37] = 32'h5eec2c16;
      expv[38] = 32'h942cd1f8;
      expv[39] = 32'h629f410a;
      expv[40] = 32'h5111cca3;
      expv[41] = 32'hfc134dc8;
      expv[42] = 32'h11a00ebe;
      expv[43] = 32'h2b3f091d;
      expv[44] = 32'h5f5aa5b1;
      expv[45] = 32'h5b1bc87e;
      expv[46] = 32'hb6266916;
      expv[47] = 32'h13eacd6b;
      expv[48] = 32'ha9ffb0d2;
      expv[49] = 32'h1f8025f8;
      expv[50] = 32'h5bb6b405;
      expv[51] = 32'hfd7a8ba4;
      expv[52] = 32'h8c3a5237;
      expv[53] = 32'h4575354d;
      expv[54] = 32'h4bedf92c;
      expv[55] = 32'h86e70bd9;
      expv[56] = 32'h6ee063f3;
      expv[57] = 32'h4aacd5ad;
      expv[58] = 32'h490f101a;
      expv[59] = 32'h20270b94;
      expv[60] = 32'h4847c58d;
      expv[61] = 32'h7ce1e5ff;
      expv[62] = 32'he964dcec;
      expv[63] = 32'hd02d0b83;
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
