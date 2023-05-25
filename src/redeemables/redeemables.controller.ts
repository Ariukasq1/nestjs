import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
} from '@nestjs/common';
import { RedeemablesService } from './redeemables.service';
import { UpdateRedeemableDto } from './dto/update-redeemable.dto';

@Controller('redeemables')
export class RedeemablesController {
  constructor(private readonly redeemablesService: RedeemablesService) {}

  @Post()
  create(@Body() body) {
    return this.redeemablesService.create(body);
  }

  @Get()
  findAll() {
    return this.redeemablesService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.redeemablesService.findOne({ id: +id });
  }

  @Patch(':id')
  update(
    @Param('id') id: string,
    @Body() updateRedeemableDto: UpdateRedeemableDto,
  ) {
    return this.redeemablesService.update({ id: +id }, updateRedeemableDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.redeemablesService.remove({ id: +id });
  }
}
