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

  autovcoder_095558 dut (
    .WCLK(clk),
    .WE(in_vec[56:56]),
    .ADDRA(in_vec[55:50]),
    .DIA(in_vec[49:49]),
    .ADDRB(in_vec[48:43]),
    .DIB(in_vec[42:42]),
    .ADDRC(in_vec[41:36]),
    .DIC(in_vec[35:35]),
    .ADDRD(in_vec[34:29]),
    .DID(in_vec[28:28]),
    .ADDRE(in_vec[27:22]),
    .DIE(in_vec[21:21]),
    .ADDRF(in_vec[20:15]),
    .DIF(in_vec[14:14]),
    .ADDRG(in_vec[13:8]),
    .DIG(in_vec[7:7]),
    .ADDRH(in_vec[6:1]),
    .DIH(in_vec[0:0]),
    .DOA(out_vec[7:7]),
    .DOB(out_vec[6:6]),
    .DOC(out_vec[5:5]),
    .DOD(out_vec[4:4]),
    .DOE(out_vec[3:3]),
    .DOF(out_vec[2:2]),
    .DOG(out_vec[1:1]),
    .DOH(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 57'h09ded54aeb0af80;
    stim[1] = 57'h13cbbdfe55a49a8;
    stim[2] = 57'h162a2028a538b00;
    stim[3] = 57'h074de152914fbd8;
    stim[4] = 57'h12ea734722a0d4f;
    stim[5] = 57'h1020d7835a0d939;
    stim[6] = 57'h15bd8b35587f12e;
    stim[7] = 57'h17be2dc1502525c;
    stim[8] = 57'h1713ded5e92f896;
    stim[9] = 57'h0dc3c7cbe09af8f;
    stim[10] = 57'h1da6aa2f5148da9;
    stim[11] = 57'h071ea9a76520253;
    stim[12] = 57'h1752680b7cf212f;
    stim[13] = 57'h0877de112a92f51;
    stim[14] = 57'h1e98b74912b8d3f;
    stim[15] = 57'h01d7ee7008a7712;
    stim[16] = 57'h05a2baefc107b14;
    stim[17] = 57'h136090c4d70c9a8;
    stim[18] = 57'h02046df1fa9c546;
    stim[19] = 57'h00b481689cc4207;
    stim[20] = 57'h16041d5242adc0b;
    stim[21] = 57'h1a87d1e891628e6;
    stim[22] = 57'h013fb5cff410590;
    stim[23] = 57'h063d206379ac9e8;
    stim[24] = 57'h14ed9899cf27b88;
    stim[25] = 57'h12328b307e5d233;
    stim[26] = 57'h0bce0df2b1ef3ef;
    stim[27] = 57'h16e8e40e9f8699e;
    stim[28] = 57'h19eef2691dfd6c9;
    stim[29] = 57'h0a2b74ab92a7bc6;
    stim[30] = 57'h17cc560c1b19310;
    stim[31] = 57'h1e382a0f5aea614;
    stim[32] = 57'h0380c5e06dac2aa;
    stim[33] = 57'h0843a04dc61a769;
    stim[34] = 57'h0a3b6981705496d;
    stim[35] = 57'h06452bb28142e7e;
    stim[36] = 57'h1414d9d45880eba;
    stim[37] = 57'h1ac56f642022889;
    stim[38] = 57'h02b73fe41aace0a;
    stim[39] = 57'h03e7466c51b8584;
    stim[40] = 57'h0e0a9bd7469d12f;
    stim[41] = 57'h07f5d7e5f015b57;
    stim[42] = 57'h05a4ab1662ffe96;
    stim[43] = 57'h05f15b1958cbd6e;
    stim[44] = 57'h18b6abe6177ac19;
    stim[45] = 57'h0de67a6994545dc;
    stim[46] = 57'h02391ab825005e5;
    stim[47] = 57'h147f434966b1c4e;
    stim[48] = 57'h1d13626c28f4af2;
    stim[49] = 57'h03eb75ab96214da;
    stim[50] = 57'h0bc4e37a2e488c8;
    stim[51] = 57'h01cf4fa03132efd;
    stim[52] = 57'h106e23023b847a6;
    stim[53] = 57'h0fd8e009eb62e87;
    stim[54] = 57'h1cfca6d8a3c8f13;
    stim[55] = 57'h154ba0bccf99d20;
    stim[56] = 57'h0dbf5f6dd12d952;
    stim[57] = 57'h12cc03630a2738c;
    stim[58] = 57'h1d26eb4bf71ea1c;
    stim[59] = 57'h194aaaf14bc87aa;
    stim[60] = 57'h0f38d17325bfb0b;
    stim[61] = 57'h062431aa5ce8087;
    stim[62] = 57'h07743dfb458d7be;
    stim[63] = 57'h0238f51f509ee40;
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
      expv[0] = 8'h00;
      expv[1] = 8'h00;
      expv[2] = 8'h00;
      expv[3] = 8'h00;
      expv[4] = 8'h04;
      expv[5] = 8'h80;
      expv[6] = 8'h00;
      expv[7] = 8'h00;
      expv[8] = 8'hc0;
      expv[9] = 8'h00;
      expv[10] = 8'h10;
      expv[11] = 8'h80;
      expv[12] = 8'h00;
      expv[13] = 8'h00;
      expv[14] = 8'h00;
      expv[15] = 8'h20;
      expv[16] = 8'h00;
      expv[17] = 8'h01;
      expv[18] = 8'h00;
      expv[19] = 8'h08;
      expv[20] = 8'h00;
      expv[21] = 8'h00;
      expv[22] = 8'h10;
      expv[23] = 8'h00;
      expv[24] = 8'h00;
      expv[25] = 8'h2c;
      expv[26] = 8'h42;
      expv[27] = 8'h08;
      expv[28] = 8'h80;
      expv[29] = 8'h04;
      expv[30] = 8'h00;
      expv[31] = 8'h00;
      expv[32] = 8'h00;
      expv[33] = 8'h00;
      expv[34] = 8'h08;
      expv[35] = 8'h80;
      expv[36] = 8'h00;
      expv[37] = 8'h0c;
      expv[38] = 8'h81;
      expv[39] = 8'h88;
      expv[40] = 8'h01;
      expv[41] = 8'h00;
      expv[42] = 8'h10;
      expv[43] = 8'h04;
      expv[44] = 8'h08;
      expv[45] = 8'h00;
      expv[46] = 8'h10;
      expv[47] = 8'h19;
      expv[48] = 8'h08;
      expv[49] = 8'h82;
      expv[50] = 8'h01;
      expv[51] = 8'h08;
      expv[52] = 8'h40;
      expv[53] = 8'h00;
      expv[54] = 8'h46;
      expv[55] = 8'h42;
      expv[56] = 8'h00;
      expv[57] = 8'h02;
      expv[58] = 8'h00;
      expv[59] = 8'h04;
      expv[60] = 8'h09;
      expv[61] = 8'h50;
      expv[62] = 8'h01;
      expv[63] = 8'h0c;
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
