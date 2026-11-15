// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 100;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_02298 dut (
    .data0(in_vec[99:84]),
    .data1(in_vec[83:68]),
    .data2(in_vec[67:52]),
    .data3(in_vec[51:36]),
    .data4(in_vec[35:20]),
    .data5(in_vec[19:4]),
    .op(in_vec[3:2]),
    .shop(in_vec[1:0]),
    .out(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 100'h8ed9cfc383b4a2a45d0640853;
    stim[1] = 100'h0bbbfa7ed3ed963c12ff936dd;
    stim[2] = 100'had3fc82a82431ed95d165d45f;
    stim[3] = 100'h75259284c61f09318f56ae764;
    stim[4] = 100'hddab6c986446fa4beff524793;
    stim[5] = 100'hbb7f96506a672e63a0dbe7d6b;
    stim[6] = 100'hd1f52f43f54c6142a3795da4b;
    stim[7] = 100'hba2cf7185436ae085ec2d9ba6;
    stim[8] = 100'hfd53470268e4675e0f27a1e97;
    stim[9] = 100'hca63848b609f42d89606031ed;
    stim[10] = 100'hf90ac480c83bc9e231bfed655;
    stim[11] = 100'h26ff210e207b46d70ada7af9b;
    stim[12] = 100'h6b8abfdffbfc7f24f007fc0f4;
    stim[13] = 100'h5edf9c346450ccc4745caba39;
    stim[14] = 100'hfe4ede5dcbc4b945e48f620cb;
    stim[15] = 100'hf737209a1437ff4fd2c6b7eb2;
    stim[16] = 100'h4e64b7fee583354795f4642d4;
    stim[17] = 100'h65d6df40b8384de4d9142eacf;
    stim[18] = 100'h0f3632926dd1b849564cd1890;
    stim[19] = 100'had9be883e3f9335b8999ac08c;
    stim[20] = 100'h5e026463f3bee6399f9d06dea;
    stim[21] = 100'hcb42beddeb1741dc4264fe6b4;
    stim[22] = 100'hd6c4d1255fec598d13e4c4bd0;
    stim[23] = 100'hfae346798afad3eb56091f6cf;
    stim[24] = 100'h8678da6b5329b00f6ae804451;
    stim[25] = 100'h1528c6855da3078d56105ac3a;
    stim[26] = 100'h78044a1ec5bbf7d9b8b0f74f9;
    stim[27] = 100'hf2d7002fb7083e789fd2a9c15;
    stim[28] = 100'hf9d023fb912632599aefe9837;
    stim[29] = 100'hc14b0135699615c213928ab31;
    stim[30] = 100'hf8445b180f85595bef62b0a2a;
    stim[31] = 100'heef5bedc3fc29fc86bd9264ba;
    stim[32] = 100'h3521e7082c2832a1ca02dafb3;
    stim[33] = 100'h8501eaf001ff3925257d44e07;
    stim[34] = 100'hc1c85a6a2e186f60eddb15fea;
    stim[35] = 100'h9b9a3b00a087d4fdefdae8c1d;
    stim[36] = 100'h5560aa761896764f0be6571c9;
    stim[37] = 100'h1763dc905cf82353bdbcb85c6;
    stim[38] = 100'h7979312b614731f31a831e4ef;
    stim[39] = 100'hccb64fe3e1b61d3ac235e4da8;
    stim[40] = 100'h32da9859c58733460e68c9159;
    stim[41] = 100'h782fa7b721a8653b9d30af10a;
    stim[42] = 100'hbdaf7c3fddb3ab8a10298fcbc;
    stim[43] = 100'h1c942329b3673d60cb5c40dd5;
    stim[44] = 100'h30a11575e852f599ab1b68f7f;
    stim[45] = 100'h1472cf04c273cd19da4a773a7;
    stim[46] = 100'hc8184b149497793c96b949829;
    stim[47] = 100'h32cd5d8aa811565e3a446adfa;
    stim[48] = 100'hf009cd0d8515bd31e22630828;
    stim[49] = 100'hcfabf5aaaf3da60112a735e29;
    stim[50] = 100'hf2456e594749ff666c82a509e;
    stim[51] = 100'h75a63155d1b790fe425997df9;
    stim[52] = 100'h3ceb0d40b4b32191757223e3c;
    stim[53] = 100'h1a64a808df1e8144798dacb4f;
    stim[54] = 100'hd4c1d86d6d485f55139a59d5c;
    stim[55] = 100'h8d921a0a4cd6427ef7f6e8724;
    stim[56] = 100'h42b53e552075dbb85664ae4ad;
    stim[57] = 100'h06423f04c16075b15ea3609c5;
    stim[58] = 100'h34f724ec32139933fa26f5f3f;
    stim[59] = 100'hd74b72136cf614f46f1ab8ed3;
    stim[60] = 100'h3b6b36cbbcf4b0aa5dc35e7af;
    stim[61] = 100'h88a806b989a83f57a03ccacbc;
    stim[62] = 100'h1ad8f9e6af930bb46675e1604;
    stim[63] = 100'h51fc0f693010c9886ff97259d;
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
      expv[0] = 16'h8ed9;
      expv[1] = 16'h12ff;
      expv[2] = 16'h5d45;
      expv[3] = 16'h9284;
      expv[4] = 16'hddab;
      expv[5] = 16'h6a67;
      expv[6] = 16'hf54c;
      expv[7] = 16'hf718;
      expv[8] = 16'h4702;
      expv[9] = 16'h9606;
      expv[10] = 16'hc480;
      expv[11] = 16'h207b;
      expv[12] = 16'hbfdf;
      expv[13] = 16'h6450;
      expv[14] = 16'hcbc4;
      expv[15] = 16'hf737;
      expv[16] = 16'hb7fe;
      expv[17] = 16'h2eac;
      expv[18] = 16'h0f36;
      expv[19] = 16'h335b;
      expv[20] = 16'hf3be;
      expv[21] = 16'hbedd;
      expv[22] = 16'hd6c4;
      expv[23] = 16'h1f6c;
      expv[24] = 16'h8678;
      expv[25] = 16'h5da3;
      expv[26] = 16'hc5bb;
      expv[27] = 16'h002f;
      expv[28] = 16'h23fb;
      expv[29] = 16'hc14b;
      expv[30] = 16'h0f85;
      expv[31] = 16'h3fc2;
      expv[32] = 16'h3521;
      expv[33] = 16'heaf0;
      expv[34] = 16'h2e18;
      expv[35] = 16'hefda;
      expv[36] = 16'h1896;
      expv[37] = 16'hdc90;
      expv[38] = 16'h1e4e;
      expv[39] = 16'he1b6;
      expv[40] = 16'hc587;
      expv[41] = 16'h21a8;
      expv[42] = 16'hab8a;
      expv[43] = 16'h2329;
      expv[44] = 16'h68f7;
      expv[45] = 16'hcf04;
      expv[46] = 16'h9497;
      expv[47] = 16'ha811;
      expv[48] = 16'h8515;
      expv[49] = 16'haf3d;
      expv[50] = 16'ha509;
      expv[51] = 16'hd1b7;
      expv[52] = 16'h2191;
      expv[53] = 16'hacb4;
      expv[54] = 16'h5f55;
      expv[55] = 16'h1a0a;
      expv[56] = 16'h5664;
      expv[57] = 16'h3f04;
      expv[58] = 16'hf5f3;
      expv[59] = 16'hd74b;
      expv[60] = 16'h5e7a;
      expv[61] = 16'h3f57;
      expv[62] = 16'hf9e6;
      expv[63] = 16'h6ff9;
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
