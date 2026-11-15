// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 36;
  localparam OW = 35;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_188865 dut (
    .clk(clk),
    .rst(in_vec[35:35]),
    .input_i(in_vec[34:19]),
    .input_i_tvalid(in_vec[18:18]),
    .input_q(in_vec[17:2]),
    .input_q_tvalid(in_vec[1:1]),
    .output_tready(in_vec[0:0]),
    .input_i_tready(out_vec[34:34]),
    .input_q_tready(out_vec[33:33]),
    .output_i(out_vec[32:17]),
    .output_q(out_vec[16:1]),
    .output_tvalid(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 36'hdddbda7e9;
    stim[1] = 36'hf0b9a857a;
    stim[2] = 36'h40471007a;
    stim[3] = 36'h1ed6d8339;
    stim[4] = 36'h3e3d82be6;
    stim[5] = 36'h3d3e08b4c;
    stim[6] = 36'h3d43440a6;
    stim[7] = 36'h271a06b1a;
    stim[8] = 36'h3a407ad78;
    stim[9] = 36'h3a250d2b5;
    stim[10] = 36'h8f8ac9f98;
    stim[11] = 36'h693bef846;
    stim[12] = 36'h5eade31b1;
    stim[13] = 36'h27822dd52;
    stim[14] = 36'h7411354ae;
    stim[15] = 36'h2c49172a7;
    stim[16] = 36'h2d8b3c57f;
    stim[17] = 36'h54e373051;
    stim[18] = 36'h25eeb02b6;
    stim[19] = 36'h7e3811960;
    stim[20] = 36'h4a5d540ad;
    stim[21] = 36'h3f6d38914;
    stim[22] = 36'h0089ab7fe;
    stim[23] = 36'h744c08668;
    stim[24] = 36'h06828c1e5;
    stim[25] = 36'h6ec798431;
    stim[26] = 36'h354d334f2;
    stim[27] = 36'h46152ec61;
    stim[28] = 36'h54cae5e38;
    stim[29] = 36'h5c89959f0;
    stim[30] = 36'h607374025;
    stim[31] = 36'h6e1188a8f;
    stim[32] = 36'h0041692c8;
    stim[33] = 36'h5c69d74bf;
    stim[34] = 36'h32cf4cf5b;
    stim[35] = 36'h698f29cec;
    stim[36] = 36'h3e0df5746;
    stim[37] = 36'h268e420ee;
    stim[38] = 36'h0230996ac;
    stim[39] = 36'h22ed6ce81;
    stim[40] = 36'h36433ad29;
    stim[41] = 36'h5709371b1;
    stim[42] = 36'h0aebe1505;
    stim[43] = 36'h2a0b3bae8;
    stim[44] = 36'h3c31c8959;
    stim[45] = 36'h0fbaebfcd;
    stim[46] = 36'h34d6785c6;
    stim[47] = 36'h08e1ac290;
    stim[48] = 36'h702a34447;
    stim[49] = 36'h69033016c;
    stim[50] = 36'h775458665;
    stim[51] = 36'h7b8b2607b;
    stim[52] = 36'h6a75ab351;
    stim[53] = 36'h7eaa43ea8;
    stim[54] = 36'h6c771e7ff;
    stim[55] = 36'h7c6017d4e;
    stim[56] = 36'h77e2cc143;
    stim[57] = 36'h271408e0d;
    stim[58] = 36'h5783458bd;
    stim[59] = 36'h2bf8602d2;
    stim[60] = 36'h29d9f255a;
    stim[61] = 36'h6cfbb5459;
    stim[62] = 36'h5e5ef1eee;
    stim[63] = 36'h10012531b;
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
      expv[0] = 35'hxxxxxxxxx;
      expv[1] = 35'h600000000;
      expv[2] = 35'h600000000;
      expv[3] = 35'h40000803c;
      expv[4] = 35'h07b5a803d;
      expv[5] = 35'h07b5a803d;
      expv[6] = 35'h07b5a803d;
      expv[7] = 35'h07b5a803d;
      expv[8] = 35'h07b5a803d;
      expv[9] = 35'h67b5a803d;
      expv[10] = 35'h67b5a803c;
      expv[11] = 35'h600000000;
      expv[12] = 35'h7a4ef7c23;
      expv[13] = 35'h77ab77c22;
      expv[14] = 35'h57ab76ea8;
      expv[15] = 35'h57ab76ea8;
      expv[16] = 35'h57ab76ea8;
      expv[17] = 35'h57ab76ea8;
      expv[18] = 35'h1538d6ea9;
      expv[19] = 35'h1538d6ea9;
      expv[20] = 35'h7538d6ea9;
      expv[21] = 35'h729756ea8;
      expv[22] = 35'h729756ea8;
      expv[23] = 35'h529755bfe;
      expv[24] = 35'h529755bfe;
      expv[25] = 35'h529755bfe;
      expv[26] = 35'h529755bfe;
      expv[27] = 35'h529755bfe;
      expv[28] = 35'h529755bfe;
      expv[29] = 35'h1532b5bff;
      expv[30] = 35'h7532b5bff;
      expv[31] = 35'h781cd5bfe;
      expv[32] = 35'h581cc4546;
      expv[33] = 35'h601044547;
      expv[34] = 35'h771a6ba5e;
      expv[35] = 35'h0cb3c67ad;
      expv[36] = 35'h0cb3c67ad;
      expv[37] = 35'h0cb3c67ad;
      expv[38] = 35'h0cb3c67ad;
      expv[39] = 35'h6cb3c67ad;
      expv[40] = 35'h68bb467ac;
      expv[41] = 35'h68bb467ac;
      expv[42] = 35'h68bb467ac;
      expv[43] = 35'h22bae67ac;
      expv[44] = 35'h22bae67ac;
      expv[45] = 35'h22bae67ac;
      expv[46] = 35'h22bae67ac;
      expv[47] = 35'h02bafc2e3;
      expv[48] = 35'h62bafc2e3;
      expv[49] = 35'h62bafa222;
      expv[50] = 35'h62bafa222;
      expv[51] = 35'h3dd51a222;
      expv[52] = 35'h7dd51303d;
      expv[53] = 35'h7dd51303c;
      expv[54] = 35'h3faa9303c;
      expv[55] = 35'h1faa8f3ff;
      expv[56] = 35'h7faa8f3ff;
      expv[57] = 35'h7df8a60a0;
      expv[58] = 35'h7df8a60a0;
      expv[59] = 35'h35e0c60a0;
      expv[60] = 35'h15e0d0169;
      expv[61] = 35'h75e0d0169;
      expv[62] = 35'h75e0d0168;
      expv[63] = 35'h7797b8f77;
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
