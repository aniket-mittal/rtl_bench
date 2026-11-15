// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 72;
  localparam OW = 66;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_06996 dut (
    .clk(clk),
    .resetn(in_vec[71:71]),
    .ser_rx(in_vec[70:70]),
    .reg_div_we(in_vec[69:66]),
    .reg_div_di(in_vec[65:34]),
    .reg_dat_we(in_vec[33:33]),
    .reg_dat_re(in_vec[32:32]),
    .reg_dat_di(in_vec[31:0]),
    .ser_tx(out_vec[65:65]),
    .reg_div_do(out_vec[64:33]),
    .reg_dat_do(out_vec[32:1]),
    .reg_dat_wait(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 72'h0b91b95bd499eda7f5;
    stim[1] = 72'h187784f61f1780a898;
    stim[2] = 72'hf8aa308b6802dfbc0f;
    stim[3] = 72'h97b4fd38f342bc798b;
    stim[4] = 72'ha07696267793b0545a;
    stim[5] = 72'he2ab90907008df36e0;
    stim[6] = 72'hffb4f666d8cfcd6c1d;
    stim[7] = 72'hc8644dfca35ed0fb27;
    stim[8] = 72'hb73b89161ba56aac63;
    stim[9] = 72'he2706cebae78422a07;
    stim[10] = 72'hfca241caaf0c8f7705;
    stim[11] = 72'hb1d20ef04226b0f6c0;
    stim[12] = 72'he8ce6fe7765b60b5e3;
    stim[13] = 72'h9d0685573e4deb722e;
    stim[14] = 72'hf7cd56a57953dba2fa;
    stim[15] = 72'he3e91be1ff8f47f669;
    stim[16] = 72'hcf2ae2d1ab57c2c158;
    stim[17] = 72'hcee9a0cbf715429c5f;
    stim[18] = 72'hce7acf66fb3f07e50d;
    stim[19] = 72'h074845a08022cd19c4;
    stim[20] = 72'h8bcbaa94a8ac88e1b7;
    stim[21] = 72'hb2addee0ac7905e261;
    stim[22] = 72'h896d15a1d65e343df7;
    stim[23] = 72'hea1a3098edad07809b;
    stim[24] = 72'hbd828585c88063abac;
    stim[25] = 72'hc23a8ebaee4bf67ce7;
    stim[26] = 72'h8b16a33d84ee144ea7;
    stim[27] = 72'hdc2a1485b9b5d0ac76;
    stim[28] = 72'h8d852f0ba65a64ecdd;
    stim[29] = 72'h8d9f35152b5b3ad8d2;
    stim[30] = 72'he5002576ec4dd5dc84;
    stim[31] = 72'hb2d5dde0d7011d03b6;
    stim[32] = 72'ha80a1220c58225bf85;
    stim[33] = 72'h82821917626e59f264;
    stim[34] = 72'hf13e501588ab467487;
    stim[35] = 72'h845a0938c1bc5b3528;
    stim[36] = 72'hc4c8b1bf28aff13881;
    stim[37] = 72'hecc717c49fa7c5c6e6;
    stim[38] = 72'h9c9255d252be563fa3;
    stim[39] = 72'hc4c06ebe316f91690f;
    stim[40] = 72'hce3e9aca48844d53dd;
    stim[41] = 72'he6ed77e8c3b49f8f1b;
    stim[42] = 72'hd5e5395cf6f105087b;
    stim[43] = 72'hfdd47a92e84c5e925c;
    stim[44] = 72'hd23ffbf60f134b6932;
    stim[45] = 72'hfca97085531428f02e;
    stim[46] = 72'hea25c516f92c5f8de4;
    stim[47] = 72'haa8129c0c4ff626bf4;
    stim[48] = 72'hf24a4d9d0fddd29ab5;
    stim[49] = 72'h86a12678d25d079417;
    stim[50] = 72'hd571326bc54dfa491f;
    stim[51] = 72'hcaf865ee0020342c45;
    stim[52] = 72'hd0f104e8005d435567;
    stim[53] = 72'h935edd55af33a26838;
    stim[54] = 72'hd1a77706f1cfa559ed;
    stim[55] = 72'haa34156387108931b5;
    stim[56] = 72'hb074d6ae9104d43333;
    stim[57] = 72'hca241ace879160d4cd;
    stim[58] = 72'h8656f182d48d694f7d;
    stim[59] = 72'hfe03db0af0738c8f3b;
    stim[60] = 72'h1ab05f93a6e4d83806;
    stim[61] = 72'hcd98f6ea187c7bdc1c;
    stim[62] = 72'hcc14f8d93a0ffa336d;
    stim[63] = 72'hd876fad8188baee50b;
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
      expv[0] = 66'hxxxxxxxxxxxxxxxxx;
      expv[1] = 66'h200000003ffffffff;
      expv[2] = 66'h200000003fffffffe;
      expv[3] = 66'h255184403ffffffff;
      expv[4] = 66'h2547e4479ffffffff;
      expv[5] = 66'h23a7e4479fffffffe;
      expv[6] = 66'h3547e4479fffffffe;
      expv[7] = 66'h3da7b336dffffffff;
      expv[8] = 66'h3da7aff6dffffffff;
      expv[9] = 66'h39dc4ff0dffffffff;
      expv[10] = 66'h339c4ff0dffffffff;
      expv[11] = 66'h25120e557ffffffff;
      expv[12] = 66'h2e906e557ffffffff;
      expv[13] = 66'h26707f357ffffffff;
      expv[14] = 66'h26742ab9ffffffffe;
      expv[15] = 66'h3e6aaaabdffffffff;
      expv[16] = 66'h3f4aaaabdffffffff;
      expv[17] = 66'h3f4ab68d5ffffffff;
      expv[18] = 66'h3f4aa65fbffffffff;
      expv[19] = 66'h3f4abb37dfffffffe;
      expv[20] = 66'h200000003fffffffe;
      expv[21] = 66'h200014a03fffffffe;
      expv[22] = 66'h356ef4a03ffffffff;
      expv[23] = 66'h356eed003fffffffe;
      expv[24] = 66'h30cee4c03fffffffe;
      expv[25] = 66'h2c142c2e5ffffffff;
      expv[26] = 66'h2c142c2e5fffffffe;
      expv[27] = 66'h2c1439ee5fffffffe;
      expv[28] = 66'h2c10a42ddffffffff;
      expv[29] = 66'h2c10b85d3ffffffff;
      expv[30] = 66'h2c10a8a95fffffffe;
      expv[31] = 66'h2810a8b77ffffffff;
      expv[32] = 66'h36aee8b77fffffffe;
      expv[33] = 66'h204ef1177ffffffff;
      expv[34] = 66'h204ef1177fffffffe;
      expv[35] = 66'h29f291177fffffffe;
      expv[36] = 66'h29f291061fffffffe;
      expv[37] = 66'h29f291195ffffffff;
      expv[38] = 66'h26329e24fffffffff;
      expv[39] = 66'h2632ae929fffffffe;
      expv[40] = 66'h2632ae919fffffffe;
      expv[41] = 66'h2632b6525ffffffff;
      expv[42] = 66'h3772b6461ffffffff;
      expv[43] = 66'h3769d647bfffffffe;
      expv[44] = 66'h2ea3d4975ffffffff;
      expv[45] = 66'h2ebfd4975ffffffff;
      expv[46] = 66'h254b842a9fffffffe;
      expv[47] = 66'h312b88aa9fffffffe;
      expv[48] = 66'h340b8e0a9ffffffff;
      expv[49] = 66'h32526e0a9ffffffff;
      expv[50] = 66'h32526e069fffffffe;
      expv[51] = 66'h32498e1e3fffffffe;
      expv[52] = 66'h32498f7e3fffffffe;
      expv[53] = 66'h32482f7e3ffffffff;
      expv[54] = 66'h3256ef7e3fffffffe;
      expv[55] = 66'h325baf7e3ffffffff;
      expv[56] = 66'h31bbab1e3fffffffe;
      expv[57] = 66'h23a6ab1e3ffffffff;
      expv[58] = 66'h23a6b67e3fffffffe;
      expv[59] = 66'h23a6b676bfffffffe;
      expv[60] = 66'h301ed8579ffffffff;
      expv[61] = 66'h200000003fffffffe;
      expv[62] = 66'h20001750dffffffff;
      expv[63] = 66'h200006c9dfffffffe;
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
