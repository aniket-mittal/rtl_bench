// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 1;
  localparam OW = 44;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_034951 dut (
    .clk(clk),
    .rst_n(in_vec[0:0]),
    .c1(out_vec[43:36]),
    .x(out_vec[35:28]),
    .y(out_vec[27:20]),
    .act1(out_vec[19:12]),
    .act2(out_vec[11:4]),
    .i(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 1'h0;
    stim[1] = 1'h0;
    stim[2] = 1'h1;
    stim[3] = 1'h1;
    stim[4] = 1'h1;
    stim[5] = 1'h1;
    stim[6] = 1'h1;
    stim[7] = 1'h1;
    stim[8] = 1'h1;
    stim[9] = 1'h1;
    stim[10] = 1'h1;
    stim[11] = 1'h1;
    stim[12] = 1'h1;
    stim[13] = 1'h1;
    stim[14] = 1'h1;
    stim[15] = 1'h1;
    stim[16] = 1'h1;
    stim[17] = 1'h1;
    stim[18] = 1'h1;
    stim[19] = 1'h1;
    stim[20] = 1'h1;
    stim[21] = 1'h1;
    stim[22] = 1'h1;
    stim[23] = 1'h1;
    stim[24] = 1'h1;
    stim[25] = 1'h1;
    stim[26] = 1'h1;
    stim[27] = 1'h1;
    stim[28] = 1'h1;
    stim[29] = 1'h1;
    stim[30] = 1'h1;
    stim[31] = 1'h1;
    stim[32] = 1'h1;
    stim[33] = 1'h1;
    stim[34] = 1'h1;
    stim[35] = 1'h1;
    stim[36] = 1'h1;
    stim[37] = 1'h1;
    stim[38] = 1'h1;
    stim[39] = 1'h1;
    stim[40] = 1'h1;
    stim[41] = 1'h1;
    stim[42] = 1'h1;
    stim[43] = 1'h1;
    stim[44] = 1'h1;
    stim[45] = 1'h1;
    stim[46] = 1'h1;
    stim[47] = 1'h1;
    stim[48] = 1'h1;
    stim[49] = 1'h1;
    stim[50] = 1'h1;
    stim[51] = 1'h1;
    stim[52] = 1'h1;
    stim[53] = 1'h1;
    stim[54] = 1'h1;
    stim[55] = 1'h1;
    stim[56] = 1'h1;
    stim[57] = 1'h1;
    stim[58] = 1'h1;
    stim[59] = 1'h1;
    stim[60] = 1'h1;
    stim[61] = 1'h1;
    stim[62] = 1'h1;
    stim[63] = 1'h1;
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
      expv[0] = 44'h00000000000;
      expv[1] = 44'h00000000000;
      expv[2] = 44'h00000000000;
      expv[3] = 44'h010a0000010;
      expv[4] = 44'h020a0101010;
      expv[5] = 44'h030a0201010;
      expv[6] = 44'h040a0301010;
      expv[7] = 44'h050a0401010;
      expv[8] = 44'h060a0501010;
      expv[9] = 44'h070a0601010;
      expv[10] = 44'h080a0701010;
      expv[11] = 44'h090a0801010;
      expv[12] = 44'h0a0a0901010;
      expv[13] = 44'h0b140a01020;
      expv[14] = 44'h0c140b02020;
      expv[15] = 44'h0d140c02020;
      expv[16] = 44'h0e140d02020;
      expv[17] = 44'h0f140e02020;
      expv[18] = 44'h10140f02020;
      expv[19] = 44'h11141002020;
      expv[20] = 44'h12141102020;
      expv[21] = 44'h13141202020;
      expv[22] = 44'h14141302020;
      expv[23] = 44'h151e1402030;
      expv[24] = 44'h161e1503030;
      expv[25] = 44'h171e1603030;
      expv[26] = 44'h181e1703030;
      expv[27] = 44'h191e1803030;
      expv[28] = 44'h1a1e1903030;
      expv[29] = 44'h1b1e1a03030;
      expv[30] = 44'h1c1e1b03030;
      expv[31] = 44'h1d1e1c03030;
      expv[32] = 44'h1e1e1d03030;
      expv[33] = 44'h1f281e03040;
      expv[34] = 44'h20281f04040;
      expv[35] = 44'h21282004040;
      expv[36] = 44'h22282104040;
      expv[37] = 44'h23282204040;
      expv[38] = 44'h24282304040;
      expv[39] = 44'h25282404040;
      expv[40] = 44'h26282504040;
      expv[41] = 44'h27282604040;
      expv[42] = 44'h28282704040;
      expv[43] = 44'h29322804050;
      expv[44] = 44'h2a322905050;
      expv[45] = 44'h2b322a05050;
      expv[46] = 44'h2c322b05050;
      expv[47] = 44'h2d322c05050;
      expv[48] = 44'h2e322d05050;
      expv[49] = 44'h2f322e05050;
      expv[50] = 44'h30322f05050;
      expv[51] = 44'h31323005050;
      expv[52] = 44'h32323105050;
      expv[53] = 44'h333c3205060;
      expv[54] = 44'h343c3306060;
      expv[55] = 44'h353c3406060;
      expv[56] = 44'h363c3506060;
      expv[57] = 44'h373c3606060;
      expv[58] = 44'h383c3706060;
      expv[59] = 44'h393c3806060;
      expv[60] = 44'h3a3c3906060;
      expv[61] = 44'h3b3c3a06060;
      expv[62] = 44'h3c3c3b06060;
      expv[63] = 44'h3d463c06070;
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
