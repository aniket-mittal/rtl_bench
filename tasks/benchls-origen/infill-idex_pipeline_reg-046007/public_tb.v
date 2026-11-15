// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 156;
  localparam OW = 153;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_046007 dut (
    .clk(clk),
    .rst(in_vec[155:155]),
    .Flush(in_vec[154:154]),
    .Freeze(in_vec[153:153]),
    .Dest_in(in_vec[152:148]),
    .Val1_in(in_vec[147:116]),
    .Val2_in(in_vec[115:84]),
    .Reg2_in(in_vec[83:52]),
    .PC_in(in_vec[51:20]),
    .EXE_CMD_in(in_vec[19:16]),
    .MEM_R_EN_in(in_vec[15:15]),
    .MEM_W_EN_in(in_vec[14:14]),
    .WB_EN_in(in_vec[13:13]),
    .Branch_Type_in(in_vec[12:11]),
    .is_imm_in(in_vec[10:10]),
    .src1_in(in_vec[9:5]),
    .src2_in(in_vec[4:0]),
    .Dest(out_vec[152:148]),
    .Val1(out_vec[147:116]),
    .Val2(out_vec[115:84]),
    .Reg2(out_vec[83:52]),
    .PC(out_vec[51:20]),
    .EXE_CMD(out_vec[19:16]),
    .MEM_R_EN(out_vec[15:15]),
    .MEM_W_EN(out_vec[14:14]),
    .WB_EN(out_vec[13:13]),
    .Branch_Type(out_vec[12:11]),
    .is_imm(out_vec[10:10]),
    .src1(out_vec[9:5]),
    .src2(out_vec[4:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 156'h905c2c94074a3005d968e8e4883daec4ccf5d02;
    stim[1] = 156'h9f27343a52ab820440904246dec9cc91e40bf76;
    stim[2] = 156'h765fe46fd5f0abdf9fbbc18fa96e7714143d755;
    stim[3] = 156'h5c70cd6dba939d233c89cc53e17047f634fe09c;
    stim[4] = 156'h68fd12355b284c6f8e0f708b7bce8401b453ef7;
    stim[5] = 156'h20edafddaa107dadca768389dbef6e2fae5559c;
    stim[6] = 156'h1c13b7fb73d131676bea3daca3f05139224475b;
    stim[7] = 156'h3c6dabae6ad54d5be72317e7bf7de74986ba97d;
    stim[8] = 156'h7f857e7c94f423697c1fd6ed97c192d23db4445;
    stim[9] = 156'h042bf2e3f281460eb0dac4032ad1cd9c82dbc1a;
    stim[10] = 156'h2f713e8471335797a8351937332d929c2f32984;
    stim[11] = 156'h7fd3cc38719e3d164459c2286c0c8b320501089;
    stim[12] = 156'h2a23e77f2990c3641fe19f295ef79ca3cace1b5;
    stim[13] = 156'h651d7c04be8ef9fd9d8a3149d76ae8d033cc213;
    stim[14] = 156'h1f7f8cdc8a675181327713cd16721a3651481dc;
    stim[15] = 156'h137ec47dffef12340bebb38b96b9abd907fe641;
    stim[16] = 156'h1673144cc874cb2c41e70cf9928e243cb387814;
    stim[17] = 156'h506d7fe7bb7a1a341fe34d307e739dee5834c4b;
    stim[18] = 156'h5e468d504bc8b1293bfc801fb46f95c1d17da94;
    stim[19] = 156'h71196d827fc451292835096ce702a28ada4b342;
    stim[20] = 156'h68f91c865d2f289a56f9e7da990060cf40833e5;
    stim[21] = 156'h5f948465bc9b1050ace63205575601364c95f2d;
    stim[22] = 156'h545e35f94f36db55b121cb4ac337a5fc8d3b0e4;
    stim[23] = 156'h78b151af55b10170f8ebf8612cc3bcecad589a4;
    stim[24] = 156'h7b720e70781c35bd1ddfd1c4faaaf8cd881df91;
    stim[25] = 156'h1490631f83919ac8c83e434dc032dedf08f830d;
    stim[26] = 156'h304daef5494d9f9d45baf2846e5986f22d3129d;
    stim[27] = 156'h3ab49ad75a8e8e4b677bffec6c528864e895445;
    stim[28] = 156'h1e1e34ec9da3e44b2bd95c06559b34effab085b;
    stim[29] = 156'h711f6e713a3527411ece113f322429e3483fc9c;
    stim[30] = 156'h2e2b99296f2020aaa917ef3eb98c8081987350a;
    stim[31] = 156'h02a61acbd7342f8be5d9cdd2ac3af6e946c4b71;
    stim[32] = 156'h5489f779338ff06aa2e2c442135c460fbd8be25;
    stim[33] = 156'h184477b3971f068bed81aa54f05f72b7db45dea;
    stim[34] = 156'h7c4cbb802943e3fe1d9c191ae5e945833a03753;
    stim[35] = 156'h4cdac137e2c294f038e4c750185dfbe34ce9e12;
    stim[36] = 156'h3bda318efec3280620e52caba74d17362599127;
    stim[37] = 156'h1df47a61bbc526bc6041b341fe29ba853fa1b18;
    stim[38] = 156'h66dd8eac962930e12c34b9c2450a1ac270f15f7;
    stim[39] = 156'h76b571b1327fd7e97a347f9e167910ae883d691;
    stim[40] = 156'h0b222d400d9c58ee26bdacbf2b8256672d2b544;
    stim[41] = 156'h3619924c672ead26c50917151f897a14e7e8da7;
    stim[42] = 156'h0db9a3c3e59fcfc6767d15798a9024c0f8a6db8;
    stim[43] = 156'h1723ad84bc90af18670e71f4ce9d50ed995f605;
    stim[44] = 156'h5d6483c64292e261b10d92de6d44741f514456e;
    stim[45] = 156'h2574b2bd16c29310c0da2803640e9e9439cc00e;
    stim[46] = 156'h4c54b56d43baea7d4b41ff328167d9eea66b0d6;
    stim[47] = 156'h1f49fe6d2aabdfab133939d3f62847b66b973f9;
    stim[48] = 156'h1dc94964c0cb2d3878a04e51ebec413351b2120;
    stim[49] = 156'h07d9bcff1bfc62a6bc842d791bf6591fdb26180;
    stim[50] = 156'h1d6f03bf882c29337dbaf0b2144d4cac4e9d5a8;
    stim[51] = 156'h6956b7884da839975f9546403b9bb38b6df6579;
    stim[52] = 156'h777bc15868be64bf55fb1a187b77e9fae65908c;
    stim[53] = 156'h3b048f28b067be9fd50572025786979fc7b9f79;
    stim[54] = 156'h4affff0cf2bf99b39575488ee9b983bfb8db6df;
    stim[55] = 156'h4582df412508d1276601a8bb9f318b1228a0814;
    stim[56] = 156'h7f9f737d68192e7ae4409249328cc86d1e17bcc;
    stim[57] = 156'h1fa6844e4f586a6bf419d5c0648f74cda5ddd52;
    stim[58] = 156'h61de6319b48bc1a6bd2857b0ba36fd8927fedd7;
    stim[59] = 156'h17860afb27fb65835dac54be899623560233295;
    stim[60] = 156'h27f2544fd4cba8eeee25f8b4385657c738918cd;
    stim[61] = 156'h7c9402b7978546a552ba12fc4171e706f533b3c;
    stim[62] = 156'h35feb147782dbfa2f1c37b960a2d41db2e9b900;
    stim[63] = 156'h4f42eb7034134a462863dcd5c96dd40e376372b;
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
      expv[0] = 153'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 153'h000000000000000000000000000000000000000;
      expv[2] = 153'h000000000000000000000000000000000000000;
      expv[3] = 153'h000000000000000000000000000000000000000;
      expv[4] = 153'h000000000000000000000000000000000000000;
      expv[5] = 153'h000000000000000000000000000000000000000;
      expv[6] = 153'h000000000000000000000000000000000000000;
      expv[7] = 153'h1c13b7fb73d131676bea3daca3f05139224475b;
      expv[8] = 153'h1c13b7fb73d131676bea3daca3f05139224475b;
      expv[9] = 153'h000000000000000000000000000000000000000;
      expv[10] = 153'h042bf2e3f281460eb0dac4032ad1cd9c82dbc1a;
      expv[11] = 153'h042bf2e3f281460eb0dac4032ad1cd9c82dbc1a;
      expv[12] = 153'h000000000000000000000000000000000000000;
      expv[13] = 153'h000000000000000000000000000000000000000;
      expv[14] = 153'h000000000000000000000000000000000000000;
      expv[15] = 153'h1f7f8cdc8a675181327713cd16721a3651481dc;
      expv[16] = 153'h137ec47dffef12340bebb38b96b9abd907fe641;
      expv[17] = 153'h1673144cc874cb2c41e70cf9928e243cb387814;
      expv[18] = 153'h000000000000000000000000000000000000000;
      expv[19] = 153'h000000000000000000000000000000000000000;
      expv[20] = 153'h000000000000000000000000000000000000000;
      expv[21] = 153'h000000000000000000000000000000000000000;
      expv[22] = 153'h000000000000000000000000000000000000000;
      expv[23] = 153'h000000000000000000000000000000000000000;
      expv[24] = 153'h000000000000000000000000000000000000000;
      expv[25] = 153'h000000000000000000000000000000000000000;
      expv[26] = 153'h1490631f83919ac8c83e434dc032dedf08f830d;
      expv[27] = 153'h1490631f83919ac8c83e434dc032dedf08f830d;
      expv[28] = 153'h1490631f83919ac8c83e434dc032dedf08f830d;
      expv[29] = 153'h1e1e34ec9da3e44b2bd95c06559b34effab085b;
      expv[30] = 153'h000000000000000000000000000000000000000;
      expv[31] = 153'h000000000000000000000000000000000000000;
      expv[32] = 153'h02a61acbd7342f8be5d9cdd2ac3af6e946c4b71;
      expv[33] = 153'h000000000000000000000000000000000000000;
      expv[34] = 153'h184477b3971f068bed81aa54f05f72b7db45dea;
      expv[35] = 153'h000000000000000000000000000000000000000;
      expv[36] = 153'h000000000000000000000000000000000000000;
      expv[37] = 153'h000000000000000000000000000000000000000;
      expv[38] = 153'h1df47a61bbc526bc6041b341fe29ba853fa1b18;
      expv[39] = 153'h000000000000000000000000000000000000000;
      expv[40] = 153'h000000000000000000000000000000000000000;
      expv[41] = 153'h0b222d400d9c58ee26bdacbf2b8256672d2b544;
      expv[42] = 153'h0b222d400d9c58ee26bdacbf2b8256672d2b544;
      expv[43] = 153'h0db9a3c3e59fcfc6767d15798a9024c0f8a6db8;
      expv[44] = 153'h1723ad84bc90af18670e71f4ce9d50ed995f605;
      expv[45] = 153'h000000000000000000000000000000000000000;
      expv[46] = 153'h000000000000000000000000000000000000000;
      expv[47] = 153'h000000000000000000000000000000000000000;
      expv[48] = 153'h1f49fe6d2aabdfab133939d3f62847b66b973f9;
      expv[49] = 153'h1dc94964c0cb2d3878a04e51ebec413351b2120;
      expv[50] = 153'h07d9bcff1bfc62a6bc842d791bf6591fdb26180;
      expv[51] = 153'h1d6f03bf882c29337dbaf0b2144d4cac4e9d5a8;
      expv[52] = 153'h000000000000000000000000000000000000000;
      expv[53] = 153'h000000000000000000000000000000000000000;
      expv[54] = 153'h000000000000000000000000000000000000000;
      expv[55] = 153'h000000000000000000000000000000000000000;
      expv[56] = 153'h000000000000000000000000000000000000000;
      expv[57] = 153'h000000000000000000000000000000000000000;
      expv[58] = 153'h1fa6844e4f586a6bf419d5c0648f74cda5ddd52;
      expv[59] = 153'h000000000000000000000000000000000000000;
      expv[60] = 153'h17860afb27fb65835dac54be899623560233295;
      expv[61] = 153'h17860afb27fb65835dac54be899623560233295;
      expv[62] = 153'h000000000000000000000000000000000000000;
      expv[63] = 153'h000000000000000000000000000000000000000;
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
