// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 34;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_057300 dut (
    .i_c0(in_vec[33:33]),
    .i_pk(in_vec[32:17]),
    .i_gk(in_vec[16:1]),
    .i_p_addn(in_vec[0:0]),
    .o_s(out_vec[16:1]),
    .o_carry(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 34'h2f5fb0a95;
    stim[1] = 34'h30c2d3649;
    stim[2] = 34'h2a5cd9a6f;
    stim[3] = 34'h1e53a7f44;
    stim[4] = 34'h186665ab9;
    stim[5] = 34'h09e7a6661;
    stim[6] = 34'h36b399b45;
    stim[7] = 34'h390a1b08d;
    stim[8] = 34'h15c8a2a4f;
    stim[9] = 34'h3a337d392;
    stim[10] = 34'h303f5e4a7;
    stim[11] = 34'h11de2f51c;
    stim[12] = 34'h3ade9b6c5;
    stim[13] = 34'h0c13ad8c2;
    stim[14] = 34'h19ecd678d;
    stim[15] = 34'h1ee7b7618;
    stim[16] = 34'h20ef57dff;
    stim[17] = 34'h11f59d4e9;
    stim[18] = 34'h1173b9d88;
    stim[19] = 34'h14bd0f963;
    stim[20] = 34'h345c3aca5;
    stim[21] = 34'h11b7e13ba;
    stim[22] = 34'h0404715fd;
    stim[23] = 34'h3e765c236;
    stim[24] = 34'h3c90625c1;
    stim[25] = 34'h269a35a5f;
    stim[26] = 34'h01b019d59;
    stim[27] = 34'h23eb06835;
    stim[28] = 34'h1333381f8;
    stim[29] = 34'h388d865c7;
    stim[30] = 34'h3ac744ea8;
    stim[31] = 34'h1b102ef83;
    stim[32] = 34'h20587cdf1;
    stim[33] = 34'h268928ef4;
    stim[34] = 34'h3255271ff;
    stim[35] = 34'h3c55efcca;
    stim[36] = 34'h144485d2e;
    stim[37] = 34'h34c269a69;
    stim[38] = 34'h3cc009e8f;
    stim[39] = 34'h0d308d12d;
    stim[40] = 34'h250ecd953;
    stim[41] = 34'h16bc2ca0f;
    stim[42] = 34'h07bb4c061;
    stim[43] = 34'h03ac6f2eb;
    stim[44] = 34'h0ff072635;
    stim[45] = 34'h00353ac5c;
    stim[46] = 34'h1f8ee55a5;
    stim[47] = 34'h1c18068c0;
    stim[48] = 34'h2d7fcf383;
    stim[49] = 34'h00acd23e4;
    stim[50] = 34'h355a479fe;
    stim[51] = 34'h26f837eba;
    stim[52] = 34'h33601840a;
    stim[53] = 34'h16f646863;
    stim[54] = 34'h06d8c8c25;
    stim[55] = 34'h23667e862;
    stim[56] = 34'h3562d40e5;
    stim[57] = 34'h2f89cd425;
    stim[58] = 34'h33d437045;
    stim[59] = 34'h32cfd7e04;
    stim[60] = 34'h0ff0ddfd6;
    stim[61] = 34'h1fdcd5cb1;
    stim[62] = 34'h17ecd6c53;
    stim[63] = 34'h11aa2a5fb;
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
      expv[0] = 17'h054dx;
      expv[1] = 17'h1d4bx;
      expv[2] = 17'h1251x;
      expv[3] = 17'h1afbx;
      expv[4] = 17'h1871x;
      expv[5] = 17'h0e6bx;
      expv[6] = 17'h0e9bx;
      expv[7] = 17'h045bx;
      expv[8] = 17'h1bc1x;
      expv[9] = 17'h0b01x;
      expv[10] = 17'h07ebx;
      expv[11] = 17'h043dx;
      expv[12] = 17'h0746x;
      expv[13] = 17'h1c4bx;
      expv[14] = 17'h1e5dx;
      expv[15] = 17'h1b64x;
      expv[16] = 17'h0410x;
      expv[17] = 17'h0028x;
      expv[18] = 17'h0982x;
      expv[19] = 17'h00d1x;
      expv[20] = 17'h0a88x;
      expv[21] = 17'h1880x;
      expv[22] = 17'h0dfbx;
      expv[23] = 17'h0d70x;
      expv[24] = 17'h1368x;
      expv[25] = 17'h0691x;
      expv[26] = 17'h195bx;
      expv[27] = 17'h05adx;
      expv[28] = 17'h084cx;
      expv[29] = 17'h1f75x;
      expv[30] = 17'h1852x;
      expv[31] = 17'h0da0x;
      expv[32] = 17'h12a6x;
      expv[33] = 17'h1c17x;
      expv[34] = 17'h172ax;
      expv[35] = 17'h088cx;
      expv[36] = 17'h14a1x;
      expv[37] = 17'h0ccfx;
      expv[38] = 17'h0451x;
      expv[39] = 17'h1c55x;
      expv[40] = 17'h1564x;
      expv[41] = 17'h04bdx;
      expv[42] = 17'h14f7x;
      expv[43] = 17'h16b1x;
      expv[44] = 17'h0076x;
      expv[45] = 17'h1efex;
      expv[46] = 17'h1e7ax;
      expv[47] = 17'h1a40x;
      expv[48] = 17'h184fx;
      expv[49] = 17'h0f90x;
      expv[50] = 17'h1125x;
      expv[51] = 17'h026fx;
      expv[52] = 17'h08a1x;
      expv[53] = 17'h10bax;
      expv[54] = 17'h1c1cx;
      expv[55] = 17'h152ax;
      expv[56] = 17'h163ex;
      expv[57] = 17'h1e4dx;
      expv[58] = 17'h169cx;
      expv[59] = 17'h164fx;
      expv[60] = 17'h1f4ax;
      expv[61] = 17'h1f0ax;
      expv[62] = 17'h1126x;
      expv[63] = 17'h0e55x;
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
