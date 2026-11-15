// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 163;
  localparam OW = 81;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_01540 dut (
    .io_ins_0_0_addr(in_vec[162:99]),
    .io_ins_0_0_isWr(in_vec[98:98]),
    .io_ins_0_0_size(in_vec[97:82]),
    .io_ins_1_0_addr(in_vec[81:18]),
    .io_ins_1_0_isWr(in_vec[17:17]),
    .io_ins_1_0_size(in_vec[16:1]),
    .io_sel(in_vec[0:0]),
    .io_out_0_addr(out_vec[80:17]),
    .io_out_0_isWr(out_vec[16:16]),
    .io_out_0_size(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 163'h081de9dea443c5a0821b8fe536a648604e796571a;
    stim[1] = 163'h6650e01313d28487eb0ebe35f30325843b5e9374d;
    stim[2] = 163'h23d3650be1070f638aa039404e017fbe62f35a35a;
    stim[3] = 163'h324afb3180dca7dd895d120c151a0a6d1b4e93ab3;
    stim[4] = 163'h3c7f755f242902600cf681f42fcfcc1ced4830678;
    stim[5] = 163'h38aec458f3ae4b8a97fd0103ec0f5c56086bcfed3;
    stim[6] = 163'h1b31d9194ad07e5ee70515a00711b2dfcf83bdbdf;
    stim[7] = 163'h7f7a3a9fdd0a82b3d1549c31d5eece4bf64b6f506;
    stim[8] = 163'h0db255f6bf8b5edf74f43333b108f21ec0877b679;
    stim[9] = 163'h613da6e822325b9976394cf6e1a689c619f3c3373;
    stim[10] = 163'h7bad784d1bff5281e43b9311659493f700fc1fd86;
    stim[11] = 163'h2bacfba89b1833a0a467482e5f56a85b3330d7164;
    stim[12] = 163'h20f09d70fae9fa6e7aa5433225ba4b3638b32d133;
    stim[13] = 163'h0ea9373c0bd38d9a57ab4c84576a565f0a7dff5b9;
    stim[14] = 163'h56d902be63c3d9864c5b5debeeb151f912146f44d;
    stim[15] = 163'h1d2a0b8b7d451ab75358be18f8a98411b2178143e;
    stim[16] = 163'h3ab9cef865fd19c6ba451742e4a3bf015c498fa78;
    stim[17] = 163'h76e7c620660cddc149eae24ed5c7e0392db627583;
    stim[18] = 163'h26ca2ae4c995fce5304889d1d8b0ae393200f8623;
    stim[19] = 163'h131bf491f19596a6b036cc6cb036f890f156e284b;
    stim[20] = 163'h57972c395797f98695cf3ca4c7f8a853f91cc18f5;
    stim[21] = 163'h704c2167c8ddceb742a04d7de186f4d3be0d00fb2;
    stim[22] = 163'h4931861655916aaa913c92af627ddf386aba6b84b;
    stim[23] = 163'h1d65204c3243f52354c4c544664e39c20fa39ddd4;
    stim[24] = 163'h0d5b7685f370ae03745a2b67ed0fc1f548f5b8c84;
    stim[25] = 163'h6f386e320d4c0a504293f9625a9f4a74a5e446f0e;
    stim[26] = 163'h651128120d71405d6e4485d08ad447cdacb83e917;
    stim[27] = 163'h71c18c37fa2d2217f6870aef45066ee17e93af009;
    stim[28] = 163'h712f5d22d2cb8e305686ee0f5ff5b2f32befa963b;
    stim[29] = 163'h35b8e31a2a896f22f862531f416bb90f285b8bd68;
    stim[30] = 163'h64841cc51f427d43457612bbfbffcb35aef4fb92b;
    stim[31] = 163'h355207e6fef35af0a90a7fce37b0dbef3a4f941b2;
    stim[32] = 163'h4f589dc57aa58a7a45c2335a5503406687f545fa8;
    stim[33] = 163'h6e86d4ec44098cfb39ebda7d41bf9c92895b86b15;
    stim[34] = 163'h255e950ca35af08eb2db0a7fd1d1d40945352004a;
    stim[35] = 163'h487f3f7115b9bb0fa6c3e778ec5ba07913efcede7;
    stim[36] = 163'h3ddf085fca9f6d7157d48fabd9f19f80df2809819;
    stim[37] = 163'h0a1f84487583b346e8a6e07e4bd8ad0abafc1d7b5;
    stim[38] = 163'h55043f324f82296795f25f9ac3e9ecd81c09c101a;
    stim[39] = 163'h19a92953597d5fbb681f9e7b6c38de5ab94fedff1;
    stim[40] = 163'h050011d97acf66061dd66a07aa6bca9db6591ea05;
    stim[41] = 163'h066c9f791e90ea193dd6c241a980959e15f4171ed;
    stim[42] = 163'h2180f9ae38842b43db14eaf12ccbfa94d01a55df6;
    stim[43] = 163'h4024f15b0a061453912ab813ebe93b414caff4bd6;
    stim[44] = 163'h518b4752f4db1eed5056a8ecf78b4724e6bb10f48;
    stim[45] = 163'h3b1910c5f4960ececadfec054c93e2d7db9fba3f3;
    stim[46] = 163'h0257b56582a3b8a762b93fd227a72d47ff83cf89a;
    stim[47] = 163'h24e906aa11891ec07e4e88dd65c8fe37c3cad821d;
    stim[48] = 163'h0def9320849e1f91dd1dde24a194081e286a28759;
    stim[49] = 163'h0f34873768bd0bc852517867f8c7b5bd0be6c475e;
    stim[50] = 163'h4493670decb58fac1f9f3dd51ebc8ac7515b1f98c;
    stim[51] = 163'h15307491c710116b8665e553506a9c0972b2b57e0;
    stim[52] = 163'h767b4c78d1fb5ee52e06688c4bf8eb2dd3b52c899;
    stim[53] = 163'h752e8bcd91152afe6546d066dd760172b2dde2e11;
    stim[54] = 163'h22b3449ef508a758f333ceeaf8e3db31669d2e163;
    stim[55] = 163'h2c3c98548848c1fe21ac4816166ed6655e94c64a3;
    stim[56] = 163'h384d24ed4d1b3461733e4229544894c43daf1dbb7;
    stim[57] = 163'h010ed630d8459b103821ab35fad93bb444fee9dce;
    stim[58] = 163'h2bf7a7d4331f5757d9a0c8902b965598c5fb99552;
    stim[59] = 163'h229f0fa02c7a578633ee442e620bf539e49fc4efb;
    stim[60] = 163'h00ee1aa7254d0725b36f91055ac78362f4365a604;
    stim[61] = 163'h4e6540dd623da82d9b189123bb4ebd8c68177e56c;
    stim[62] = 163'h0105a0d7b3e5e32d9ab6af18c15a8ab6ec8fcde32;
    stim[63] = 163'h7343c7384c5ebfab0e6fc20745ddc98a65be786c2;
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
      expv[0] = 81'h02077a77a910f1682086e;
      expv[1] = 81'h1f1af98192c21daf49ba6;
      expv[2] = 81'h08f4d942f841c3d8e2a80;
      expv[3] = 81'h09060a8d05368da749d59;
      expv[4] = 81'h0f1fdd57c90a4098033da;
      expv[5] = 81'h0081f607ae2b0435e7f69;
      expv[6] = 81'h0ad00388d96fe7c1dedef;
      expv[7] = 81'h1fde8ea7f742a0acf4552;
      expv[8] = 81'h1999d884790f6043bdb3c;
      expv[9] = 81'h067b70d344e30cf9e19b9;
      expv[10] = 81'h1eeb5e1346ffd4a0790ee;
      expv[11] = 81'h0aeb3eea26c60ce82919d;
      expv[12] = 81'h019912dd259b1c5996899;
      expv[13] = 81'h06422bb52b2f853effadc;
      expv[14] = 81'h0ef5f758a8fc890a37a26;
      expv[15] = 81'h074a82e2df5146add4d62;
      expv[16] = 81'h0eae73be197f4671ae914;
      expv[17] = 81'h11276ae3f01c96db13ac1;
      expv[18] = 81'h04e8ec58571c99007c311;
      expv[19] = 81'h0636581b7c4878ab71425;
      expv[20] = 81'h1e5263fc5429fc8e60c7a;
      expv[21] = 81'h1c130859f23773add0a81;
      expv[22] = 81'h0957b13eef9c355d35c25;
      expv[23] = 81'h075948130c90fd48d5313;
      expv[24] = 81'h0356dda17cdc2b80dd168;
      expv[25] = 81'h1bce1b8c8353029410a4f;
      expv[26] = 81'h02e8456a23e6d65c1f48b;
      expv[27] = 81'h0577a2833770bf49d7804;
      expv[28] = 81'h1707affad97995f7d4b1d;
      expv[29] = 81'h0d6e38c68aa25bc8be189;
      expv[30] = 81'h095dfdffe59ad77a7dc95;
      expv[31] = 81'h0d5481f9bfbcd6bc2a429;
      expv[32] = 81'h13d627715ea9629e91708;
      expv[33] = 81'h0d3ea0dfce4944adc358a;
      expv[34] = 81'h0957a54328d6bc23acb6c;
      expv[35] = 81'h13bc762dd03c89f7e76f3;
      expv[36] = 81'h07d5ecf8cfc06f9404c0c;
      expv[37] = 81'h103f25ec56855d7e0ebda;
      expv[38] = 81'h15410fcc93e08a59e57c9;
      expv[39] = 81'h0f3db61c6f2d5ca7f6ff8;
      expv[40] = 81'h1503d535e54edb2c8f502;
      expv[41] = 81'h0120d4c04acf0afa0b8f6;
      expv[42] = 81'h08603e6b8e210ad0f6c53;
      expv[43] = 81'h10093c56c2818514e44aa;
      expv[44] = 81'h1462d1d4bd36c7bb5415a;
      expv[45] = 81'h1602a649f16bedcfdd1f9;
      expv[46] = 81'h0095ed5960a8ee29d8ae4;
      expv[47] = 81'h046eb2e47f1be1e56c10e;
      expv[48] = 81'h0f1250ca040f1435143ac;
      expv[49] = 81'h03cd21cdda2f42f214945;
      expv[50] = 81'h1124d9c37b2d63eb07e7c;
      expv[51] = 81'h054c1d2471c4045ae1997;
      expv[52] = 81'h144625fc7596e9da9644c;
      expv[53] = 81'h08336ebb00b9596ef1708;
      expv[54] = 81'h07757c71ed98b34e970b1;
      expv[55] = 81'h040b0b376b32af4a63251;
      expv[56] = 81'h0114aa244a621ed78eddb;
      expv[57] = 81'h0043b58c361166c40e086;
      expv[58] = 81'h0afde9f50cc7d5d5f6683;
      expv[59] = 81'h02173105fa9cf24fe277d;
      expv[60] = 81'h003b86a9c95341c96cdbe;
      expv[61] = 81'h13995037588f6a0b66c62;
      expv[62] = 81'h00416835ecf978cb66ada;
      expv[63] = 81'h1cd0f1ce1317afeac39bf;
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
