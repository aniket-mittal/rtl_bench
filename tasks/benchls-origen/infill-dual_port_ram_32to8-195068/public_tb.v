// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 57;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_195068 dut (
    .wrclock(clk),
    .wren(in_vec[56:56]),
    .wraddress(in_vec[55:48]),
    .byteena_a(in_vec[47:44]),
    .data(in_vec[43:12]),
    .rdclock(in_vec[11:11]),
    .rden(in_vec[10:10]),
    .rdaddress(in_vec[9:0]),
    .q(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 57'h07c8839f8c8d0dc;
    stim[1] = 57'h1ddd636caa8132f;
    stim[2] = 57'h10b088974d9b815;
    stim[3] = 57'h19618ab0a338bb8;
    stim[4] = 57'h13a5d6f6d31aeb4;
    stim[5] = 57'h1f4cbf745c90ee9;
    stim[6] = 57'h1adebeeec6ad132;
    stim[7] = 57'h0f6fe501198500d;
    stim[8] = 57'h030b26305d9ea55;
    stim[9] = 57'h01f3bdf7f990e79;
    stim[10] = 57'h0a1bd94ebbf2e03;
    stim[11] = 57'h1f35ab58fb11f1b;
    stim[12] = 57'h0c117127b50394e;
    stim[13] = 57'h07ecf835dc3f374;
    stim[14] = 57'h08d867bf3a7f572;
    stim[15] = 57'h0865aa47fb1aa2c;
    stim[16] = 57'h14fcab56c71828a;
    stim[17] = 57'h182a83e69950319;
    stim[18] = 57'h1b443d786457439;
    stim[19] = 57'h1fd1b99bae7a207;
    stim[20] = 57'h0166e3633a8a77f;
    stim[21] = 57'h03da4cca1cbb233;
    stim[22] = 57'h02d198d05c9645f;
    stim[23] = 57'h0849ba966b9a823;
    stim[24] = 57'h099a20bff7532f4;
    stim[25] = 57'h05651d94f82aca8;
    stim[26] = 57'h0477fe31f92d545;
    stim[27] = 57'h0af3e8ecd3bca36;
    stim[28] = 57'h1b2cc43fbe6df58;
    stim[29] = 57'h066a8eaa4f1c1bb;
    stim[30] = 57'h096bbfda58f72b9;
    stim[31] = 57'h0ce4a2607a3aa4f;
    stim[32] = 57'h0b6c5ff0df5b532;
    stim[33] = 57'h1b6030d66848fc4;
    stim[34] = 57'h1e5a8ebdda43580;
    stim[35] = 57'h0f42298040cb772;
    stim[36] = 57'h121ea0f52e26101;
    stim[37] = 57'h0538ec6d6f76012;
    stim[38] = 57'h0c38755203fea08;
    stim[39] = 57'h194a03a120efec8;
    stim[40] = 57'h055eda26c7f24ff;
    stim[41] = 57'h10956361a25fac8;
    stim[42] = 57'h041bcc838fca2ca;
    stim[43] = 57'h15e5a7540eaf0a4;
    stim[44] = 57'h0048df5ed4ddd56;
    stim[45] = 57'h044789eb37225d9;
    stim[46] = 57'h0b6731f0d8a9349;
    stim[47] = 57'h10cc24762a0c6bc;
    stim[48] = 57'h0f3b5fc74ea65c3;
    stim[49] = 57'h0b74d6f035281a1;
    stim[50] = 57'h0d290f0d4cf59c9;
    stim[51] = 57'h0364df03c6a97ef;
    stim[52] = 57'h106b5aae4204ac1;
    stim[53] = 57'h05c575c69738bfd;
    stim[54] = 57'h1eb987cd7ecba9d;
    stim[55] = 57'h0899c12cf84ed08;
    stim[56] = 57'h0790e13fac68ccb;
    stim[57] = 57'h141f3d8d3ffbb19;
    stim[58] = 57'h1101be8bc83eb92;
    stim[59] = 57'h07850848231cd4f;
    stim[60] = 57'h028907d93e01cba;
    stim[61] = 57'h1ea6c7e11479da8;
    stim[62] = 57'h16c90df483462a7;
    stim[63] = 57'h1606bb0827d14f2;
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
      expv[0] = 8'hxx;
      expv[1] = 8'hxx;
      expv[2] = 8'hxx;
      expv[3] = 8'hxx;
      expv[4] = 8'hxx;
      expv[5] = 8'hxx;
      expv[6] = 8'hxx;
      expv[7] = 8'hxx;
      expv[8] = 8'hxx;
      expv[9] = 8'hxx;
      expv[10] = 8'hxx;
      expv[11] = 8'hxx;
      expv[12] = 8'hxx;
      expv[13] = 8'hxx;
      expv[14] = 8'hxx;
      expv[15] = 8'hxx;
      expv[16] = 8'hxx;
      expv[17] = 8'hxx;
      expv[18] = 8'hxx;
      expv[19] = 8'hxx;
      expv[20] = 8'hxx;
      expv[21] = 8'hxx;
      expv[22] = 8'hxx;
      expv[23] = 8'hxx;
      expv[24] = 8'hxx;
      expv[25] = 8'hxx;
      expv[26] = 8'hxx;
      expv[27] = 8'hxx;
      expv[28] = 8'hxx;
      expv[29] = 8'hxx;
      expv[30] = 8'hxx;
      expv[31] = 8'hxx;
      expv[32] = 8'hxx;
      expv[33] = 8'h00;
      expv[34] = 8'h00;
      expv[35] = 8'h00;
      expv[36] = 8'h00;
      expv[37] = 8'h00;
      expv[38] = 8'h00;
      expv[39] = 8'h00;
      expv[40] = 8'h00;
      expv[41] = 8'h00;
      expv[42] = 8'h00;
      expv[43] = 8'h00;
      expv[44] = 8'h00;
      expv[45] = 8'h00;
      expv[46] = 8'h00;
      expv[47] = 8'h00;
      expv[48] = 8'h00;
      expv[49] = 8'h00;
      expv[50] = 8'h00;
      expv[51] = 8'h00;
      expv[52] = 8'h00;
      expv[53] = 8'h00;
      expv[54] = 8'h00;
      expv[55] = 8'h00;
      expv[56] = 8'h00;
      expv[57] = 8'h00;
      expv[58] = 8'h00;
      expv[59] = 8'h00;
      expv[60] = 8'h00;
      expv[61] = 8'h00;
      expv[62] = 8'h00;
      expv[63] = 8'h00;
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
