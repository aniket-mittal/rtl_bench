// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_11275 dut (
    .clk(clk),
    .mem_rd_data1(in_vec[16:9]),
    .mem_rd_data2(in_vec[8:1]),
    .reset(in_vec[0:0]),
    .mem_wr_data(out_vec[32:25]),
    .mem_wr_addr(out_vec[24:17]),
    .mem_wr_en(out_vec[16:16]),
    .mem_rd_addr1(out_vec[15:8]),
    .mem_rd_addr2(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h15009;
    stim[1] = 17'h08b45;
    stim[2] = 17'h12640;
    stim[3] = 17'h02ad8;
    stim[4] = 17'h149ca;
    stim[5] = 17'h18f82;
    stim[6] = 17'h05c98;
    stim[7] = 17'h15a54;
    stim[8] = 17'h00828;
    stim[9] = 17'h0cb8c;
    stim[10] = 17'h11c90;
    stim[11] = 17'h0234a;
    stim[12] = 17'h1c2b6;
    stim[13] = 17'h03fda;
    stim[14] = 17'h0f444;
    stim[15] = 17'h11d92;
    stim[16] = 17'h08ca0;
    stim[17] = 17'h119b2;
    stim[18] = 17'h1f340;
    stim[19] = 17'h11008;
    stim[20] = 17'h1c83e;
    stim[21] = 17'h015b2;
    stim[22] = 17'h0fa4f;
    stim[23] = 17'h177dc;
    stim[24] = 17'h05c97;
    stim[25] = 17'h12354;
    stim[26] = 17'h0d12c;
    stim[27] = 17'h1ed30;
    stim[28] = 17'h03a96;
    stim[29] = 17'h1de18;
    stim[30] = 17'h04ff6;
    stim[31] = 17'h12314;
    stim[32] = 17'h1676c;
    stim[33] = 17'h19b7a;
    stim[34] = 17'h1a39a;
    stim[35] = 17'h017e0;
    stim[36] = 17'h023cc;
    stim[37] = 17'h1f658;
    stim[38] = 17'h03e22;
    stim[39] = 17'h1c6f4;
    stim[40] = 17'h1fdc6;
    stim[41] = 17'h077e0;
    stim[42] = 17'h058ec;
    stim[43] = 17'h12348;
    stim[44] = 17'h1bf8a;
    stim[45] = 17'h15c14;
    stim[46] = 17'h17182;
    stim[47] = 17'h04ab2;
    stim[48] = 17'h0798c;
    stim[49] = 17'h1f966;
    stim[50] = 17'h02b12;
    stim[51] = 17'h010a2;
    stim[52] = 17'h078b8;
    stim[53] = 17'h123a0;
    stim[54] = 17'h08188;
    stim[55] = 17'h04758;
    stim[56] = 17'h0b06a;
    stim[57] = 17'h07b50;
    stim[58] = 17'h08868;
    stim[59] = 17'h0fba2;
    stim[60] = 17'h07ca0;
    stim[61] = 17'h1d22e;
    stim[62] = 17'h1220a;
    stim[63] = 17'h06e74;
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
      expv[0] = 33'hxxxxx00xx;
      expv[1] = 33'hxxxxx00xx;
      expv[2] = 33'hxxxxx00xx;
      expv[3] = 33'hxxxxx0100;
      expv[4] = 33'hxxxxx0100;
      expv[5] = 33'hxxxxx0100;
      expv[6] = 33'hxxxxx0100;
      expv[7] = 33'hxxxxx0100;
      expv[8] = 33'hxxxxx0200;
      expv[9] = 33'hxxxxx0200;
      expv[10] = 33'hxxxxx0300;
      expv[11] = 33'hxxxxx0300;
      expv[12] = 33'hxxxxx0300;
      expv[13] = 33'hxxxxx04xx;
      expv[14] = 33'hxxxxx04xx;
      expv[15] = 33'hxxxxx05xx;
      expv[16] = 33'hxxxxx05xx;
      expv[17] = 33'hxxxxx05xx;
      expv[18] = 33'hxxxxx0600;
      expv[19] = 33'hxxxxx0600;
      expv[20] = 33'hxxxxx0600;
      expv[21] = 33'hxxxxx0600;
      expv[22] = 33'hxxxxx0000;
      expv[23] = 33'hxxxxx0000;
      expv[24] = 33'hxxxxx0000;
      expv[25] = 33'hxxxxx0000;
      expv[26] = 33'hxxxxx01xx;
      expv[27] = 33'hxxxxx01xx;
      expv[28] = 33'hxxxxx01xx;
      expv[29] = 33'hxxxxx01xx;
      expv[30] = 33'hxxxxx01xx;
      expv[31] = 33'hxxxxx0200;
      expv[32] = 33'hxxxxx0200;
      expv[33] = 33'hxxxxx0300;
      expv[34] = 33'hxxxxx0300;
      expv[35] = 33'hxxxxx0300;
      expv[36] = 33'hxxxxx0400;
      expv[37] = 33'hxxxxx0400;
      expv[38] = 33'hxxxxx0400;
      expv[39] = 33'hxxxxx0400;
      expv[40] = 33'hxxxxx0400;
      expv[41] = 33'hxxxxx0500;
      expv[42] = 33'hxxxxx0500;
      expv[43] = 33'hxxxxx0600;
      expv[44] = 33'hxxxxx0600;
      expv[45] = 33'hxxxxx0600;
      expv[46] = 33'hxxxxx0700;
      expv[47] = 33'hxxxxx0700;
      expv[48] = 33'hxxxxx0800;
      expv[49] = 33'hxxxxx0800;
      expv[50] = 33'hxxxxx0800;
      expv[51] = 33'hxxxxx0900;
      expv[52] = 33'hxxxxx0900;
      expv[53] = 33'hxxxxx0900;
      expv[54] = 33'hxxxxx0900;
      expv[55] = 33'hxxxxx0900;
      expv[56] = 33'hxxxxx0a00;
      expv[57] = 33'hxxxxx0a00;
      expv[58] = 33'hxxxxx0b00;
      expv[59] = 33'hxxxxx0b00;
      expv[60] = 33'hxxxxx0b00;
      expv[61] = 33'hxxxxx0c00;
      expv[62] = 33'hxxxxx0c00;
      expv[63] = 33'hxxxxx0d00;
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
