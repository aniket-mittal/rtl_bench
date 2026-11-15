// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 111;
  localparam OW = 73;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_125355 dut (
    .clk(clk),
    .rstn(in_vec[110:110]),
    .id_ex_rdy(in_vec[109:109]),
    .id_ex_op1(in_vec[108:77]),
    .id_ex_op2(in_vec[76:45]),
    .id_ex_funct(in_vec[44:39]),
    .id_ex_mem_st_data(in_vec[38:7]),
    .id_ex_mem_st_funct(in_vec[6:4]),
    .id_ex_mem_ld_funct(in_vec[3:1]),
    .ex_mem_ack(in_vec[0:0]),
    .id_ex_ack(out_vec[72:72]),
    .ex_mem_rdy(out_vec[71:71]),
    .ex_mem_alu_op(out_vec[70:70]),
    .ex_mem_st_data(out_vec[69:38]),
    .ex_mem_st_funct(out_vec[37:35]),
    .ex_mem_ld_funct(out_vec[34:32]),
    .ex_mem_data(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 111'h2c75ce1d3b51b11a8bd9d700ec37;
    stim[1] = 111'h20065f6188a81b942971df644a99;
    stim[2] = 111'h1329136554127488c6be3b19cbbc;
    stim[3] = 111'h55476756b92b39fb84a4fc11d5f9;
    stim[4] = 111'h44b0f3f603cca80370ad96bd3430;
    stim[5] = 111'h58748f91bee8036a97d31b6001ca;
    stim[6] = 111'h58d8cc0cd5820f1af838071f57e4;
    stim[7] = 111'h5d56743f3790b68325aba93573f9;
    stim[8] = 111'h51b825c17c0f4e7bcf0c5bc10fab;
    stim[9] = 111'h44eccbae51cd37e31e57c1993e3b;
    stim[10] = 111'h4e716a6ac1fc5f95ce8f271df3f3;
    stim[11] = 111'h6f21faa419313fd452e7ac90ce36;
    stim[12] = 111'h4661c9f6405a5c1d5cf4c559a5b0;
    stim[13] = 111'h4850c0ae3486b41ccd6a0903ebc8;
    stim[14] = 111'h4289906e2a6127247fb0686bacff;
    stim[15] = 111'h7e1c4efe4255a1d8365833dad523;
    stim[16] = 111'h7fdd74a2078697a20d905525bf8d;
    stim[17] = 111'h669a915932669122238a36ba2888;
    stim[18] = 111'h7261e9209795a0f1ddb46057a6a7;
    stim[19] = 111'h4129c52f1c971c3688487d4a712a;
    stim[20] = 111'h372c4a68b5e057318f0013b06b20;
    stim[21] = 111'h7a78b3c87cb3933088ea108b3c6e;
    stim[22] = 111'h5d8860e97bf9702b41930fa495bf;
    stim[23] = 111'h7d7cd4695f332bc0e2d62811d616;
    stim[24] = 111'h77324b193c262b62ca6e150233d1;
    stim[25] = 111'h71a739c4b1fe3d8f6c41eb0b513e;
    stim[26] = 111'h5950ccac4910ac51ed9cb5740dd6;
    stim[27] = 111'h7c7c641f1831ae84c001f22c980a;
    stim[28] = 111'h5afd3938f0f9f8aa034e793678aa;
    stim[29] = 111'h510fbf731fa917b7ec821ad4f16b;
    stim[30] = 111'h7f57faedb92a0f71cbd4564e5348;
    stim[31] = 111'h612a968e35fa6799d6ca404bdae3;
    stim[32] = 111'h553ccd6f910cdd5b21c78c421829;
    stim[33] = 111'h780fcf4a7bda47f94de4d66cef77;
    stim[34] = 111'h5207de19afed1de1abb56149c877;
    stim[35] = 111'h55d854468a51a7daf3978b07fdf9;
    stim[36] = 111'h4273335e0c3472470a9c24690207;
    stim[37] = 111'h5438b13fb2f04a302c9fa86c3197;
    stim[38] = 111'h4ae900f7170dd14ae019f16a4e0f;
    stim[39] = 111'h5a8087e03297b82104e63cf8c29e;
    stim[40] = 111'h4c759b32b95ad5e85ba45163b5ec;
    stim[41] = 111'h43687ccd7802e9313bc80f19a07f;
    stim[42] = 111'h0c1df88fc17e84e5a32c1faf099e;
    stim[43] = 111'h56efd620d9112a91f013e424b296;
    stim[44] = 111'h5e19f124ec7ce751fae8da4e301f;
    stim[45] = 111'h2ae97c89a63ab5814252f973b5a4;
    stim[46] = 111'h62aba5299ddbbfa1bc3e02181829;
    stim[47] = 111'h4f6ce4e739f5b18be7eaf9eb64c8;
    stim[48] = 111'h6a236fcc1963bdc27c4aa8c7c482;
    stim[49] = 111'h4548d3b9465094fa5b520796c839;
    stim[50] = 111'h409db4e1c5912fecbd339bac1dac;
    stim[51] = 111'h579c606035b347548d08940826e3;
    stim[52] = 111'h724acc2d205808ecf8cccfdaba4c;
    stim[53] = 111'h53406042f3804a437a529ffc6d11;
    stim[54] = 111'h5c7ce09fec85928f8dc3cb1c8db7;
    stim[55] = 111'h608384bcdb0462daf423cf037828;
    stim[56] = 111'h422761e53f39f78a9f019a1c3104;
    stim[57] = 111'h75c0b70721534f9c2bd8df7e4866;
    stim[58] = 111'h61af29437617244ceeb4622c813c;
    stim[59] = 111'h7bcca20d869d3eb05ed16a28381d;
    stim[60] = 111'h77b02c925c164fb93a8ceac54d8d;
    stim[61] = 111'h57ad1cf1dc99c93de584bee2625e;
    stim[62] = 111'h65743fac233a62e002257dd15343;
    stim[63] = 111'h450d929e351d29fa188918a5a2c8;
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
      expv[0] = 73'h0000000000000000000;
      expv[1] = 73'h0000000000000000000;
      expv[2] = 73'h0000000000000000000;
      expv[3] = 73'h0000000000000000000;
      expv[4] = 73'h0000000000000000000;
      expv[5] = 73'h0000000000000000000;
      expv[6] = 73'h0000000000000000000;
      expv[7] = 73'h0000000000000000000;
      expv[8] = 73'h0000000000000000000;
      expv[9] = 73'h0000000000000000000;
      expv[10] = 73'h0000000000000000000;
      expv[11] = 73'h0000000000000000000;
      expv[12] = 73'h1f3d648671bxxxxxxxx;
      expv[13] = 73'h1f3d648671bxxxxxxxx;
      expv[14] = 73'h1f3d648671bxxxxxxxx;
      expv[15] = 73'h033d6486700xxxxxxxx;
      expv[16] = 73'h1ec19ed6a9100000000;
      expv[17] = 73'h02c19ed6a8000000000;
      expv[18] = 73'h1ec19ed6a8400000000;
      expv[19] = 73'h02c19ed6a8000000000;
      expv[20] = 73'h0000000000000000000;
      expv[21] = 73'h0000000000000000000;
      expv[22] = 73'h1f508459e3715920000;
      expv[23] = 73'h03508459e0015920000;
      expv[24] = 73'h1eb1408eb0b00000000;
      expv[25] = 73'h02b1408eb0000000000;
      expv[26] = 73'h1e0f585a89f00000001;
      expv[27] = 73'h1e0f585a89f00000001;
      expv[28] = 73'h1e0f585a89f00000001;
      expv[29] = 73'h1e0f585a89f00000001;
      expv[30] = 73'h020f585a88000000001;
      expv[31] = 73'h1ea2b2729a400000000;
      expv[32] = 73'h02a2b27298000000000;
      expv[33] = 73'h02a2b27298000000000;
      expv[34] = 73'h1f26b3677bb00000000;
      expv[35] = 73'h0326b36778000000000;
      expv[36] = 73'h0326b36778000000000;
      expv[37] = 73'h0326b36778000000000;
      expv[38] = 73'h0326b36778000000000;
      expv[39] = 73'h0326b36778000000000;
      expv[40] = 73'h0326b36778000000000;
      expv[41] = 73'h0326b36778000000000;
      expv[42] = 73'h0000000000000000000;
      expv[43] = 73'h0000000000000000000;
      expv[44] = 73'h0000000000000000000;
      expv[45] = 73'h0000000000000000000;
      expv[46] = 73'h0000000000000000000;
      expv[47] = 73'h1df010c0c1400000000;
      expv[48] = 73'h1df010c0c1400000000;
      expv[49] = 73'h1df010c0c1400000000;
      expv[50] = 73'h01f010c0c0000000000;
      expv[51] = 73'h01f010c0c0000000000;
      expv[52] = 73'h01f010c0c0000000000;
      expv[53] = 73'h1e667ed5d2600000000;
      expv[54] = 73'h02667ed5d0000000000;
      expv[55] = 73'h02667ed5d0000000000;
      expv[56] = 73'h1d1e781bc1400000000;
      expv[57] = 73'h1d1e781bc1400000000;
      expv[58] = 73'h1d1e781bc1400000000;
      expv[59] = 73'h1d1e781bc1400000000;
      expv[60] = 73'h011e781bc0000000000;
      expv[61] = 73'h1d1e781bc0600000000;
      expv[62] = 73'h1d1e781bc0600000000;
      expv[63] = 73'h011e781bc0000000000;
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
