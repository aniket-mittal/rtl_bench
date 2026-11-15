// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 137;
  localparam OW = 133;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_07515 dut (
    .clock(clk),
    .reset(in_vec[136:136]),
    .debugEnable(in_vec[135:135]),
    .debugReset(in_vec[134:134]),
    .syncClr(in_vec[133:133]),
    .rs(in_vec[132:128]),
    .rt(in_vec[127:123]),
    .rd(in_vec[122:118]),
    .sa(in_vec[117:113]),
    .aluOperation(in_vec[112:109]),
    .sigExt(in_vec[108:77]),
    .readData1(in_vec[76:45]),
    .readData2(in_vec[44:13]),
    .aluSrc(in_vec[12:12]),
    .aluShiftImm(in_vec[11:11]),
    .regDst(in_vec[10:10]),
    .loadImm(in_vec[9:9]),
    .memWrite(in_vec[8:5]),
    .memToReg(in_vec[4:4]),
    .memReadWidth(in_vec[3:2]),
    .regWrite(in_vec[1:1]),
    .eop(in_vec[0:0]),
    .aluOperationOut(out_vec[132:129]),
    .sigExtOut(out_vec[128:97]),
    .readData1Out(out_vec[96:65]),
    .readData2Out(out_vec[64:33]),
    .aluSrcOut(out_vec[32:32]),
    .aluShiftImmOut(out_vec[31:31]),
    .memWriteOut(out_vec[30:27]),
    .memToRegOut(out_vec[26:26]),
    .memReadWidthOut(out_vec[25:24]),
    .rsOut(out_vec[23:19]),
    .rtOut(out_vec[18:14]),
    .rdOut(out_vec[13:9]),
    .saOut(out_vec[8:4]),
    .regDstOut(out_vec[3:3]),
    .loadImmOut(out_vec[2:2]),
    .regWriteOut(out_vec[1:1]),
    .eopOut(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 137'h10a4a7ec9e92cc2ac210c07604b9620e3eb;
    stim[1] = 137'h1ac517109672109d9d1a356b77afdcfc0f1;
    stim[2] = 137'h079e231defe846c7f95e3bf473ffaec8f8c;
    stim[3] = 137'h0366506c6ef425e54e0de97f843e26421cf;
    stim[4] = 137'h0ea43adb76fbc7c8d51bfa11ed83971cec3;
    stim[5] = 137'h00c1eabde38528a32e6272ab5869e3a567b;
    stim[6] = 137'h08c59b9568854ec2ef2167ca5dc6ffb8741;
    stim[7] = 137'h03e249f8b89195cc331a56794a6d4d6a385;
    stim[8] = 137'h069f2a6cfcacfe1a275d8a2e539e5dca8cc;
    stim[9] = 137'h00eb2b70494f95fb8095b818b99cdcfbe92;
    stim[10] = 137'h009743330400d5aaeedaa03a610f17e7323;
    stim[11] = 137'h0afb034a747eba584617d7231b7d0d78c54;
    stim[12] = 137'h03e1d161c44b2e2c7465ff66dce5e5186e0;
    stim[13] = 137'h02182d5a56ce0c8d14d42ec44cb440b1213;
    stim[14] = 137'h05d5c97c0b6d2873879a2fc21e0b9e535d3;
    stim[15] = 137'h00ddad16d31cfa77bb2b967a9a607f012ba;
    stim[16] = 137'h0cde96f0806b0be12735dfd6dd6cbdd4a1f;
    stim[17] = 137'h0e0194fb947df9db4edf937f64a29339af0;
    stim[18] = 137'h05bf1c0d699a62d5f7adff7a2d1c7078887;
    stim[19] = 137'h0a15b8653a45acd1546dea015a0cf0d0bd0;
    stim[20] = 137'h059464078fb7830880000ccff610862de90;
    stim[21] = 137'h0067594cc833482705d579281788fbe1a14;
    stim[22] = 137'h0858808eda4ddf7aaa3c3587c02f6c67715;
    stim[23] = 137'h0fc9543c66158c8de294bc06fdf8674c088;
    stim[24] = 137'h09ceab5aa90fadc4f7bd11517b0fa5e9bac;
    stim[25] = 137'h0e80b6e269eea7c89ac4d0e3bca4a32e66d;
    stim[26] = 137'h090e156fc64e91db04c227fdd3e40e9b7fd;
    stim[27] = 137'h056f5e8c37ef2f831bafad2d138c997a3dd;
    stim[28] = 137'h02eabdf66445651b24ff7ea9e463a251bf4;
    stim[29] = 137'h0e0dadeebc46b8fd8643ff12ec535bf1cc7;
    stim[30] = 137'h0aeb0e409b7cf344ce434a67c80ecbadf9f;
    stim[31] = 137'h072b6dfba712bb9a434a6bc1fb59b9ae280;
    stim[32] = 137'h0eccc4c112abd99d97400acbfc5fd95b1cf;
    stim[33] = 137'h06acfce1d9d25071206c1017caef7d56a46;
    stim[34] = 137'h00c32e2464ff63c55e6c06dda2139c236c1;
    stim[35] = 137'h10de257e20b58f0700880436afbb380092a;
    stim[36] = 137'h0ad2937d2ecdb7d35f338bd86346b10a315;
    stim[37] = 137'h02c2120c15de0d5144978cba69b122cbbaf;
    stim[38] = 137'h06390056bb8f4f5d4869f69e1bfe42bd2d2;
    stim[39] = 137'h04e37e38c32ee36281da6ab2439c3f8f844;
    stim[40] = 137'h044e208dbd29500cbdff7ec3f712c7f82ee;
    stim[41] = 137'h088e6b998b9745eb816d27e86a5eb7c491b;
    stim[42] = 137'h0332508387d306e860c582cb3433f0064cb;
    stim[43] = 137'h040d3eb917b4c2a75e23844d4936714d758;
    stim[44] = 137'h0bd7cb058b1cf375e9015fb872d07ab7a45;
    stim[45] = 137'h020a763dbd5e782a2dd1c2b4b75b6e8ee38;
    stim[46] = 137'h060dbf720d0787a7e25b9028ce80860d148;
    stim[47] = 137'h0bcf9359015c0639334d05f498b9c33ff67;
    stim[48] = 137'h09d0b9f988ffd7872493b6a508b8079938b;
    stim[49] = 137'h0a0fdca1776643723796aa5545df4185c68;
    stim[50] = 137'h1befda3cdb591d2505aaa707320b5af2bbe;
    stim[51] = 137'h04c04d5885fef4f0dd57ae94c6d79f7322e;
    stim[52] = 137'h00910b3c7c47258be1ad795c058ea0c840a;
    stim[53] = 137'h03a758a17bee86303ecd71e9b6c9afb5595;
    stim[54] = 137'h049e51ff08131679da73ca3fb2bfb3ede4e;
    stim[55] = 137'h0bbdd8816d5aceddcfc74ce4759060f2d32;
    stim[56] = 137'h08b47a418fa7895e379ff34e02fbea55ab9;
    stim[57] = 137'h0cee73be7a53e3dd9f4dced41d8e83aec9b;
    stim[58] = 137'h0c23c93699fc65f7bfa408806f082c4122b;
    stim[59] = 137'h0cb25639d40b18c17b10c7ee3c07a57914c;
    stim[60] = 137'h05f5045b2e7ede0a86a67ba5a85721bbf65;
    stim[61] = 137'h0359acf549b9582cf487ec514fedf609b6e;
    stim[62] = 137'h042070f546a56dc12f87d8ef88e2335bb42;
    stim[63] = 137'h038fb191b96c445fb648d390d934d10f2fb;
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
      expv[0] = 133'h0000000000000000000000000000000000;
      expv[1] = 133'h0000000000000000000000000000000000;
      expv[2] = 133'h0000000000000000000000000000000000;
      expv[3] = 133'h0000000000000000000000000000000000;
      expv[4] = 133'h0000000000000000000000000000000000;
      expv[5] = 133'h0000000000000000000000000000000000;
      expv[6] = 133'h0000000000000000000000000000000000;
      expv[7] = 133'h1568854ec2ef2167ca5dc6ffb85062cdcd;
      expv[8] = 133'h0000000000000000000000000000000000;
      expv[9] = 133'h0000000000000000000000000000000000;
      expv[10] = 133'h0000000000000000000000000000000000;
      expv[11] = 133'h0000000000000000000000000000000000;
      expv[12] = 133'h0000000000000000000000000000000000;
      expv[13] = 133'h0000000000000000000000000000000000;
      expv[14] = 133'h0000000000000000000000000000000000;
      expv[15] = 133'h0000000000000000000000000000000000;
      expv[16] = 133'h0000000000000000000000000000000000;
      expv[17] = 133'h0000000000000000000000000000000000;
      expv[18] = 133'h0000000000000000000000000000000000;
      expv[19] = 133'h0000000000000000000000000000000000;
      expv[20] = 133'h0000000000000000000000000000000000;
      expv[21] = 133'h0000000000000000000000000000000000;
      expv[22] = 133'h0000000000000000000000000000000000;
      expv[23] = 133'h0eda4ddf7aaa3c3587c02f6c67452c404d;
      expv[24] = 133'h0000000000000000000000000000000000;
      expv[25] = 133'h1aa90fadc4f7bd11517b0fa5e9ebe755a4;
      expv[26] = 133'h0000000000000000000000000000000000;
      expv[27] = 133'h0fc64e91db04c227fdd3e40e9b7f870abd;
      expv[28] = 133'h0000000000000000000000000000000000;
      expv[29] = 133'h0000000000000000000000000000000000;
      expv[30] = 133'h0000000000000000000000000000000000;
      expv[31] = 133'h0000000000000000000000000000000000;
      expv[32] = 133'h0000000000000000000000000000000000;
      expv[33] = 133'h0000000000000000000000000000000000;
      expv[34] = 133'h0000000000000000000000000000000000;
      expv[35] = 133'h0000000000000000000000000000000000;
      expv[36] = 133'h0000000000000000000000000000000000;
      expv[37] = 133'h0000000000000000000000000000000000;
      expv[38] = 133'h0000000000000000000000000000000000;
      expv[39] = 133'h0000000000000000000000000000000000;
      expv[40] = 133'h0000000000000000000000000000000000;
      expv[41] = 133'h0000000000000000000000000000000000;
      expv[42] = 133'h198b9745eb816d27e86a5eb7c4c64735c3;
      expv[43] = 133'h0000000000000000000000000000000000;
      expv[44] = 133'h0000000000000000000000000000000000;
      expv[45] = 133'h0000000000000000000000000000000000;
      expv[46] = 133'h0000000000000000000000000000000000;
      expv[47] = 133'h0000000000000000000000000000000000;
      expv[48] = 133'h0000000000000000000000000000000000;
      expv[49] = 133'h1988ffd7872493b6a508b8079962e85cf7;
      expv[50] = 133'h0000000000000000000000000000000000;
      expv[51] = 133'h0000000000000000000000000000000000;
      expv[52] = 133'h0000000000000000000000000000000000;
      expv[53] = 133'h0000000000000000000000000000000000;
      expv[54] = 133'h0000000000000000000000000000000000;
      expv[55] = 133'h0000000000000000000000000000000000;
      expv[56] = 133'h0000000000000000000000000000000000;
      expv[57] = 133'h018fa7895e379ff34e02fbea55ae5a3d25;
      expv[58] = 133'h0000000000000000000000000000000000;
      expv[59] = 133'h0000000000000000000000000000000000;
      expv[60] = 133'h0000000000000000000000000000000000;
      expv[61] = 133'h0000000000000000000000000000000000;
      expv[62] = 133'h0000000000000000000000000000000000;
      expv[63] = 133'h0000000000000000000000000000000000;
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
